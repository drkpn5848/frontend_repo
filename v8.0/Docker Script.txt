#TaskServices (Node js)
#----------------------

FROM node:24

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm","start"]




#CoreServices (SpringBoot)
#-------------------------

# Build Stage
FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

# Runtime Stage
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/target/*.war app.war

ENTRYPOINT ["java","-jar","app.war"]




#Gateway (Python FastAPI)
#------------------------

FROM python:3.14-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]