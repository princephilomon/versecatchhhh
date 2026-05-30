from fastapi import APIRouter
from .models import DetectRequest, DetectResponse, VerseMatch, HealthResponse
from .verse_engine import match_verses, detect_language

router = APIRouter()


@router.get("/health", response_model=HealthResponse)
def health():
    return HealthResponse(status="ok", version="1.0.0")


@router.post("/detect", response_model=DetectResponse)
def detect_verse(req: DetectRequest):
    language = detect_language(req.text) if req.language == "auto" else req.language
    raw_matches = match_verses(req.text, language)

    matches = [
        VerseMatch(**m)
        for m in raw_matches
    ]

    return DetectResponse(
        matches=matches,
        transcript=req.text,
        detected_language=language,
    )
