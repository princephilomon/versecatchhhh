from pydantic import BaseModel
from typing import Optional


class DetectRequest(BaseModel):
    text: str
    language: Optional[str] = "auto"


class VerseMatch(BaseModel):
    reference: str
    book: str
    chapter: int
    verse: int
    text: str
    confidence: float
    language: str


class DetectResponse(BaseModel):
    matches: list[VerseMatch]
    transcript: str
    detected_language: str


class HistoryEntry(BaseModel):
    id: str
    reference: str
    text: str
    confidence: float
    timestamp: str
    notes: Optional[str] = None


class HealthResponse(BaseModel):
    status: str
    version: str
