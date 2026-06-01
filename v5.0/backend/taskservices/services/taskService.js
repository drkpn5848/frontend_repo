import Tasks from "../models/tasks.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

const SECRETE_KEY = process.env.SECRETE_KEY;

export async function createTask(data, token){
    let response;
    try
    {
        const payload = jwt.verify(token, SECRETE_KEY); //Authorization
        data.createdby = payload.crid;
        Tasks.create(data); //Insert into MongoDB
        response = {code: 200, message: "New task has been created"};
    }catch(e)
    {
        response = {code: 500, message: e.message};
    }
    return response;
}
