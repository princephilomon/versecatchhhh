BIBLE_VERSES: dict[str, list[dict]] = {
    "en": [
        {"book": "John", "chapter": 3, "verse": 16, "text": "For God so loved the world that he gave his one and only Son, that whoever believes in him shall not perish but have eternal life.", "keywords": ["god", "loved", "world", "son", "believe", "perish", "eternal", "life"]},
        {"book": "Romans", "chapter": 8, "verse": 28, "text": "And we know that in all things God works for the good of those who love him, who have been called according to his purpose.", "keywords": ["know", "god", "works", "good", "love", "called", "purpose"]},
        {"book": "Psalm", "chapter": 23, "verse": 1, "text": "The Lord is my shepherd, I lack nothing.", "keywords": ["lord", "shepherd", "lack", "nothing"]},
        {"book": "Psalm", "chapter": 23, "verse": 4, "text": "Even though I walk through the darkest valley, I will fear no evil, for you are with me; your rod and your staff, they comfort me.", "keywords": ["walk", "darkest", "valley", "fear", "evil", "rod", "staff", "comfort"]},
        {"book": "Philippians", "chapter": 4, "verse": 13, "text": "I can do all this through him who gives me strength.", "keywords": ["do", "all", "through", "him", "gives", "strength"]},
        {"book": "Jeremiah", "chapter": 29, "verse": 11, "text": "For I know the plans I have for you, declares the Lord, plans to prosper you and not to harm you, plans to give you hope and a future.", "keywords": ["plans", "prosper", "harm", "hope", "future", "lord"]},
        {"book": "Proverbs", "chapter": 3, "verse": 5, "text": "Trust in the Lord with all your heart and lean not on your own understanding.", "keywords": ["trust", "lord", "heart", "lean", "understanding"]},
        {"book": "Isaiah", "chapter": 40, "verse": 31, "text": "But those who hope in the Lord will renew their strength. They will soar on wings like eagles; they will run and not grow weary, they will walk and not be faint.", "keywords": ["hope", "lord", "renew", "strength", "soar", "wings", "eagles", "weary", "walk", "faint"]},
        {"book": "Joshua", "chapter": 1, "verse": 9, "text": "Have I not commanded you? Be strong and courageous. Do not be afraid; do not be discouraged, for the Lord your God will be with you wherever you go.", "keywords": ["strong", "courageous", "afraid", "discouraged", "lord", "wherever"]},
        {"book": "2 Corinthians", "chapter": 5, "verse": 17, "text": "Therefore, if anyone is in Christ, the new creation has come: The old has gone, the new is here!", "keywords": ["christ", "new", "creation", "old", "gone"]},
        {"book": "Ephesians", "chapter": 2, "verse": 8, "text": "For it is by grace you have been saved, through faith and this is not from yourselves, it is the gift of God.", "keywords": ["grace", "saved", "faith", "gift", "god"]},
        {"book": "Matthew", "chapter": 6, "verse": 33, "text": "But seek first his kingdom and his righteousness, and all these things will be given to you as well.", "keywords": ["seek", "kingdom", "righteousness", "given"]},
        {"book": "Psalm", "chapter": 121, "verse": 1, "text": "I lift up my eyes to the mountains where does my help come from?", "keywords": ["lift", "eyes", "mountains", "help"]},
        {"book": "Genesis", "chapter": 1, "verse": 1, "text": "In the beginning God created the heavens and the earth.", "keywords": ["beginning", "god", "created", "heavens", "earth"]},
        {"book": "John", "chapter": 14, "verse": 6, "text": "I am the way and the truth and the life. No one comes to the Father except through me.", "keywords": ["way", "truth", "life", "father", "except"]},
    ],
    "te": [
        {"book": "యోహాను", "chapter": 3, "verse": 16, "text": "దేవుడు లోకమును ఎంతో ప్రేమించెను గనుక తన అద్వితీయ కుమారుని అనుగ్రహించెను. ఆయనయందు విశ్వాసముంచు ప్రతివాడును నశింపక నిత్యజీవము పొందును.", "keywords": ["దేవుడు", "లోకము", "ప్రేమ", "కుమారుడు", "విశ్వాసం", "నిత్యజీవము"]},
        {"book": "కీర్తనలు", "chapter": 23, "verse": 1, "text": "యెహోవా నా కాపరి, నాకు ఏ లోటు ఉండదు.", "keywords": ["యెహోవా", "కాపరి", "లోటు"]},
    ],
    "hi": [
        {"book": "यूहन्ना", "chapter": 3, "verse": 16, "text": "परमेश्वर ने संसार से ऐसा प्रेम रखा कि उसने अपना एकलौता पुत्र दे दिया, ताकि जो कोई उस पर विश्वास करे, वह नाश न हो, बल्कि अनन्त जीवन पाए।", "keywords": ["परमेश्वर", "प्रेम", "पुत्र", "विश्वास", "अनन्त जीवन"]},
        {"book": "भजन संहिता", "chapter": 23, "verse": 1, "text": "यहोवा मेरा चरवाहा है, मुझे कुछ घटी नहीं।", "keywords": ["यहोवा", "चरवाहा", "घटी"]},
    ],
    "ta": [
        {"book": "யோவான்", "chapter": 3, "verse": 16, "text": "தேவன் உலகத்தில் அன்புகூர்ந்ததினால், தம்முடைய ஒரேபேறான குமாரனைக் கொடுத்தார். அவரை விசுவாசிக்கிறவன் எவனும் கெட்டுப்போகாமல் நித்தியஜீவனை அடைய வேண்டும்.", "keywords": ["தேவன்", "அன்பு", "உலகம்", "குமாரன்", "விசுவாசம்", "நித்தியஜீவன்"]},
        {"book": "சங்கீதம்", "chapter": 23, "verse": 1, "text": "கர்த்தர் என் மேய்ப்பர், எனக்கு குறைவு ஒன்றுமில்லை.", "keywords": ["கர்த்தர்", "மேய்ப்பர்", "குறைவு"]},
    ],
    "ml": [
        {"book": "യോഹന്നാൻ", "chapter": 3, "verse": 16, "text": "ദൈവം ലോകത്തെ ഇത്രമാത്രം സ്നേഹിച്ചു, തന്റെ ഏകജാതനായ പുത്രനെ നല്കി, അവനിൽ വിശ്വസിക്കുന്ന ഏവനും നശിച്ചുപോകാതെ നിത്യജീവൻ പ്രാപിക്കും.", "keywords": ["ദൈവം", "സ്നേഹം", "ലോകം", "പുത്രൻ", "വിശ്വാസം", "നിത്യജീവൻ"]},
        {"book": "സങ്കീർത്തനങ്ങൾ", "chapter": 23, "verse": 1, "text": "യഹോവ എന്റെ ഇടയൻ; എനിക്കു ഒന്നിനും കുറവുണ്ടാകുകയില്ല.", "keywords": ["യഹോവ", "ഇടയൻ", "കുറവ്"]},
    ],
    "kn": [
        {"book": "ಯೋಹಾನ", "chapter": 3, "verse": 16, "text": "ಹೌದು, ದೇವರು ಲೋಕವನ್ನು ಎಷ್ಟೋ ಪ್ರೀತಿಸಿ ತನ್ನ ಒಬ್ಬನೇ ಮಗನನ್ನು ಕೊಟ್ಟನು; ಆತನನ್ನು ನಂಬುವ ಒಬ್ಬನಾದರೂ ನಾಶವಾಗದೆ ಎಲ್ಲರೂ ನಿತ್ಯಜೀವವನ್ನು ಹೊಂದಬೇಕೆಂದು ಆತನನ್ನು ಕೊಟ್ಟನು.", "keywords": ["ದೇವರು", "ಲೋಕ", "ಪ್ರೀತಿ", "ಮಗ", "ನಂಬು", "ನಿತ್ಯಜೀವ"]},
        {"book": "ಕೀರ್ತನೆಗಳು", "chapter": 23, "verse": 1, "text": "ಯೆಹೋವನು ನನ್ನ ಕುರುಬನು; ನನಗೆ ಏನೂ ಕೊರತೆಯಿಲ್ಲ.", "keywords": ["ಯೆಹೋವ", "ಕುರುಬ", "ಕೊರತೆ"]},
    ],
    "bn": [
        {"book": "যোহন", "chapter": 3, "verse": 16, "text": "কারণ ঈশ্বর এই জগতকে এতোই ভালবাসেন যে তিনি তাঁর একমাত্র পুত্রকে দিলেন, যেন সেই পুত্রের ওপর যে কেউ বিশ্বাস করে সে বিনষ্ট না হয় বরং অনন্ত জীবন লাভ করে।", "keywords": ["ঈশ্বর", "জগত", "ভালবাসা", "পুত্র", "বিশ্বাস", "অনন্ত জীবন"]},
        {"book": "গীতসংহিতা", "chapter": 23, "verse": 1, "text": "সদাপ্রভু আমার মেষপালক, আমার কিছুই অভাব হবে না।", "keywords": ["সদাপ্রভু", "মেষপালক", "অভাব"]},
    ],
    "gu": [
        {"book": "યોહાન", "chapter": 3, "verse": 16, "text": "હા, દેવે જગત પર એટલી બધી પ્રીતિ કરી કે તેણે તેનો એકનો એક દીકરો આપ્યો. દેવે તેનો દીકરો આપ્યો તેથી તેનામાં દરેક વ્યક્તિ જે વિશ્વાસ કરે તેનો નાશ ન થાય, પણ તે અનંતજીવન પામે.", "keywords": ["દેવ", "જગત", "પ્રીતિ", "દીકરો", "વિશ્વાસ", "અનંતજીવન"]},
        {"book": "ગીતશાસ્ત્ર", "chapter": 23, "verse": 1, "text": "યહોવા મારો ઘેટાંપાળક છે; મને કશી ઘટત નથી.", "keywords": ["યહોવા", "ઘેટાંપાળક", "ઘટત"]},
    ],
    "mr": [
        {"book": "योहान", "chapter": 3, "verse": 16, "text": "कारण देवाने जगावर एवढी प्रीति केली की, त्याने आपला एकुलता एक पुत्र दिला, यासाठी की, जो कोणी त्याच्यावर विश्वास ठेवील त्याचा नाश होऊ नये तर त्याला सार्वकालिक जीवन मिळावे.", "keywords": ["देव", "जग", "प्रीति", "पुत्र", "विश्वास", "सार्वकालिक जीवन"]},
        {"book": "स्तोत्रसंहिता", "chapter": 23, "verse": 1, "text": "परमेश्वर माझा मेंढपाळ आहे; मला कशाचीही कमतरता भासणार नाही.", "keywords": ["परमेश्वर", "मेंढपाळ", "कमतरता"]},
    ],
    "pa": [
        {"book": "ਯੂਹੰਨਾ", "chapter": 3, "verse": 16, "text": "ਕਿਉਂਕਿ ਪਰਮੇਸ਼ੁਰ ਨੇ ਸੰਸਾਰ ਨਾਲ ਅਜਿਹਾ ਪਿਆਰ ਕੀਤਾ ਕਿ ਉਸ ਨੇ ਆਪਣਾ ਇੱਕਲੌਤਾ ਪੁੱਤਰ ਦੇ ਦਿੱਤਾ, ਤਾਂ ਜੋ ਜੋ ਕੋਈ ਉਸ ਉੱਤੇ ਵਿਸ਼ਵਾਸ ਕਰੇ, ਉਹ ਨਾਸ ਨਾ ਹੋਵੇ ਸਗੋਂ ਹਮੇਸ਼ਾ ਦਾ ਜੀਵਨ ਪਾਵੇ।", "keywords": ["ਪਰਮੇਸ਼ੁਰ", "ਸੰਸਾਰ", "ਪਿਆਰ", "ਪੁੱਤਰ", "ਵਿਸ਼ਵਾਸ", "ਹਮੇਸ਼ਾ ਜੀਵਨ"]},
        {"book": "ਜ਼ਬੂਰ", "chapter": 23, "verse": 1, "text": "ਯਹੋਵਾਹ ਮੇਰਾ ਆਚਾਰੀਆ ਹੈ; ਮੈਨੂੰ ਕਿਸੇ ਚੀਜ਼ ਦੀ ਘਾਟ ਨਹੀਂ।", "keywords": ["ਯਹੋਵਾਹ", "ਆਚਾਰੀਆ", "ਘਾਟ"]},
    ],
    "or": [
        {"book": "ଯୋହନ", "chapter": 3, "verse": 16, "text": "କାରଣ ଈଶ୍ୱର ଜଗତକୁ ଏତେ ପ୍ରେମ କଲେ ଯେ, ସେ ଆପଣା ଏକମାତ୍ର ପୁତ୍ରକୁ ଦାନ କଲେ, ଯେପରି ତାହାଙ୍କଠାରେ ବିଶ୍ୱାସ କରୁଥିବା ପ୍ରତ୍ୟେକ ବ୍ୟକ୍ତି ବିନଷ୍ଟ ନ ହୋଇ ଅନନ୍ତ ଜୀବନ ପ୍ରାପ୍ତ ହେବ।", "keywords": ["ଈଶ୍ୱର", "ଜଗତ", "ପ୍ରେମ", "ପୁତ୍ର", "ବିଶ୍ୱାସ", "ଅନନ୍ତ ଜୀବନ"]},
        {"book": "ଗୀତସଂହିତା", "chapter": 23, "verse": 1, "text": "ସଦାପ୍ରଭୁ ମୋର ପାଳକ; ମୋର କିଛି ଅଭାବ ହେବ ନାହିଁ।", "keywords": ["ସଦାପ୍ରଭୁ", "ପାଳକ", "ଅଭାବ"]},
    ],
}
