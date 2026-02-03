from fastapi import FastAPI
from app.routes import activites

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello Borning Challenge"}

" /docs : API documentation Swagger UI créé automatiquement "


app.include_router(activites.router)