from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import activites


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Hello Borning Challenge"}

" /docs : API documentation Swagger UI créé automatiquement "


app.include_router(activites.router)