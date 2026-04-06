import os
import re

dir_path = os.getcwd()
files = [f for f in os.listdir(dir_path) if f.endswith('.html')]

toggle_html = """
                        <!-- Toggles -->
                        <button class="btn btn-link text-decoration-none text-secondary p-0 me-3 d-flex align-items-center" onclick="toggleTheme()" type="button" aria-label="Toggle theme">
                            <i class="bi bi-moon-fill fs-5" id="themeIcon"></i>
                        </button>
                        <button class="btn btn-link text-decoration-none text-secondary p-0 me-3 fw-bold d-flex align-items-center" onclick="toggleRTL()" type="button" aria-label="Toggle RTL">
                            RTL
                        </button>
                        """

head_script_html = """
    <script>
        // Apply theme and direction immediately to avoid flash
        (function() {
            const savedTheme = localStorage.getItem('theme') || 'dark';
            const savedDir = localStorage.getItem('dir') || 'ltr';
            document.documentElement.setAttribute('data-bs-theme', savedTheme);
            document.documentElement.setAttribute('dir', savedDir);
        })();
    </script>
</head>"""

script_html = """
    <script>
        function updateIcons() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            document.querySelectorAll('#themeIcon').forEach(icon => {
                if(currentTheme === 'light') {
                    icon.classList.remove('bi-moon-fill');
                    icon.classList.add('bi-sun-fill');
                } else {
                    icon.classList.remove('bi-sun-fill');
                    icon.classList.add('bi-moon-fill');
                }
            });
        }

        function toggleTheme() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-bs-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            updateIcons();
        }

        function toggleRTL() {
            const isRtl = document.documentElement.getAttribute('dir') === 'rtl';
            const newDir = isRtl ? 'ltr' : 'rtl';
            document.documentElement.setAttribute('dir', newDir);
            localStorage.setItem('dir', newDir);
        }

        // Initialize icons on load
        document.addEventListener('DOMContentLoaded', updateIcons);
    </script>
</body>
"""

for file in files:
    file_path = os.path.join(dir_path, file)
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Safely remove previously added toggles/script/headScript if they exist
    content = re.sub(r'<!-- Toggles -->[\s\S]*?RTL\s*</button>\s*', '', content)
    content = re.sub(r'<script>\s*// Apply theme and direction[\s\S]*?</script>\s*</head>', '</head>', content)
    content = re.sub(r'<script>\s*function updateIcons\([\s\S]*?</script>\s*</body>', '</body>', content)
    content = re.sub(r'<script>\s*function toggleTheme\([\s\S]*?</script>\s*</body>', '</body>', content)
    
    # Insert head script
    content = content.replace('</head>', head_script_html)

    # Insert toggle buttons
    # We want to insert before <div class="d-none d-sm-flex (or d-lg-flex based on index.html)
    # Looking at index.html: <div class="d-none d-lg-flex gap-2 navbar-cta">
    # Looking at other pages might vary. Let's try to match the navbar pattern.
    
    # In index.html it was:
    # <div class="d-flex align-items-center order-lg-3">
    #     <!-- Toggles -->
    #     ...
    
    # Let's see how update_nav.js did it:
    # content = content.replace(/<div class="d-none d-sm-flex/, toggleHtml + '<div class="d-none d-sm-flex');
    
    content = content.replace('<div class="d-none d-lg-flex', toggle_html + '<div class="d-none d-lg-flex')
    content = content.replace('<div class="d-none d-sm-flex', toggle_html + '<div class="d-none d-sm-flex')

    # Insert script before </body>
    content = content.replace('</body>', script_html)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

print('Updated all HTML files with Python script.')
