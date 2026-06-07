from fastapi import APIRouter, Header
from models.schemas import TaskSchema
import httpx
import os
from dotenv import load_dotenv

router = APIRouter(prefix="/taskservice")

load_dotenv()

NODE_URL = os.getenv("NODE_URL")

@router.post("/createtask")
async def createTask(data: TaskSchema, Token: str = Header(...)):
    async with httpx.AsyncClient() as client:
        response = await client.post(NODE_URL + f"/task/createtask", json=data.model_dump(), headers={'Token': Token})
    return response.json()