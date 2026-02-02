from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello Borning Challenge"}

" /docs : API documentation Swagger UI créé automatiquement "