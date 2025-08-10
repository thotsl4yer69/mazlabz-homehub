from fastapi import FastAPI
app = FastAPI(title="StepDaddyLive stub")

@app.get("/")
def root():
    return {"service": "StepDaddyLive stub", "status": "ok"}

@app.get("/health")
def health():
    return {"ok": True}
