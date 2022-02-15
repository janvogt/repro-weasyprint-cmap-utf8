#! /usr/bin/env python3

import pdftotext

for src in ["example", "example_fixed"]:
    # Load your PDF
    with open(f'{src}.pdf', "rb") as f:
        pdf = pdftotext.PDF(f, physical=True)

    # Read all the text into one string
    with open(f'{src}.txt', "w", encoding="utf-8") as f:
        f.write("\n\n".join(pdf))