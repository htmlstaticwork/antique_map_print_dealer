import os
import glob
import re

html_files = glob.glob('*.html')

for filepath in html_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if footer exists
    if '<footer' not in content:
        continue
        
    print(f'Processing {filepath}...')
    
    # We want to replace the footer row g-5 mb-5
    # Let's find the start of the row
    pattern = r'(<div class="row g-5 mb-5 align-items-start">)(.*?)(<hr class="border-secondary opacity-25">)'
    
    def replacer(match):
        inner = match.group(2)
        # We need to completely rewrite the columns inner HTML
        
        # 1. Logo section
        # Original has: <div class="col-lg-4 text-center text-lg-start">
        # Change to: <div class="col-12 text-center mb-5">
        new_inner = inner.replace('<div class="col-lg-4 text-center text-lg-start">', '<div class="col-12 text-center mb-5">')
        
        # Original has: justify-content-center justify-content-lg-start
        new_inner = new_inner.replace('justify-content-center justify-content-lg-start', 'justify-content-center')
        
        # 2. Firm section
        # Original has: <div class="col-md-4 col-lg-2 offset-lg-1 text-center text-md-start">
        # Change to: <div class="col-md-4 text-center">
        new_inner = new_inner.replace('<div class="col-md-4 col-lg-2 offset-lg-1 text-center text-md-start">', '<div class="col-md-4 text-center">')
        
        # 3. Client Services section
        # Original has: <div class="col-md-4 col-lg-2 text-center text-md-start">
        # Change to: <div class="col-md-4 text-center">
        new_inner = new_inner.replace('<div class="col-md-4 col-lg-2 text-center text-md-start">', '<div class="col-md-4 text-center">')
        
        # 4. Newsletter section
        # Original has: <div class="col-md-4 col-lg-3 text-center text-md-start">
        # Change to: <div class="col-md-4 text-center">
        new_inner = new_inner.replace('<div class="col-md-4 col-lg-3 text-center text-md-start">', '<div class="col-md-4 text-center">')
        
        # Newsletter text text-md-start remove
        new_inner = new_inner.replace('text-center text-md-start', 'text-center')

        return match.group(1).replace('align-items-start', '') + new_inner + match.group(3)

    new_content = re.sub(pattern, replacer, content, flags=re.DOTALL)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

print('Done updating footers.')
