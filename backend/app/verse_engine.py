import re
import string
from .bible_data import BIBLE_VERSES

_ASCII_PUNCT = re.compile(f'[{re.escape(string.punctuation)}]')


def preprocess(text: str) -> tuple[str, list[str]]:
    text = text.strip()
    text = _ASCII_PUNCT.sub('', text)
    words = [w for w in text.split() if len(w) > 2]
    return text, words


def tokenize(text: str) -> set[str]:
    return set(
        w for w in _ASCII_PUNCT.sub('', text).split() if len(w) > 2
    )


def jaccard_similarity(a: set[str], b: set[str]) -> float:
    if not a or not b:
        return 0.0
    return len(a & b) / len(a | b)


def detect_language(text: str) -> str:
    script_ranges = {
        "te": (0x0C00, 0x0C7F),
        "hi": (0x0900, 0x097F),
        "ta": (0x0B80, 0x0BFF),
        "ml": (0x0D00, 0x0D7F),
        "kn": (0x0C80, 0x0CFF),
        "bn": (0x0980, 0x09FF),
        "gu": (0x0A80, 0x0AFF),
        "pa": (0x0A00, 0x0A7F),
        "or": (0x0B00, 0x0B7F),
    }
    for cp in map(ord, text):
        for lang, (start, end) in script_ranges.items():
            if start <= cp <= end:
                return lang
    return "en"


def match_verses(text: str, language: str = "auto", threshold: float = 0.15) -> list[dict]:
    if language == "auto":
        language = detect_language(text)

    if language not in BIBLE_VERSES:
        language = "en"

    _, words = preprocess(text)
    text_tokens = set(words)

    if not text_tokens:
        return []

    verses = BIBLE_VERSES.get(language, BIBLE_VERSES["en"])
    matches = []
    keyword_tokens = tokenize(text)

    for verse in verses:
        verse_tokens = set(verse["keywords"])
        confidence = jaccard_similarity(keyword_tokens, verse_tokens)

        excerpt_tokens = tokenize(verse["text"])
        excerpt_sim = jaccard_similarity(keyword_tokens, excerpt_tokens)
        confidence = max(confidence, excerpt_sim)

        if confidence >= threshold:
            matches.append({
                "reference": f"{verse['book']} {verse['chapter']}:{verse['verse']}",
                "book": verse["book"],
                "chapter": verse["chapter"],
                "verse": verse["verse"],
                "text": verse["text"],
                "confidence": round(confidence * 100, 1),
                "language": language,
            })

    matches.sort(key=lambda m: m["confidence"], reverse=True)
    return matches[:3]
