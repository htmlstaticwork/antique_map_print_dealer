const fs = require('fs');
const path = require('path');

const dir = __dirname;
const files = fs.readdirSync(dir).filter(f => f.endsWith('.html'));

const toggleHtml = `
                        <!-- Toggles -->
                        <button class="btn btn-link text-decoration-none text-secondary p-0 me-3 d-flex align-items-center" onclick="toggleTheme()" type="button" aria-label="Toggle theme">
                            <i class="bi bi-moon-fill fs-5" id="themeIcon"></i>
                        </button>
                        <button class="btn btn-link text-decoration-none text-secondary p-0 me-3 fw-bold d-flex align-items-center" onclick="toggleRTL()" type="button" aria-label="Toggle RTL">
                            RTL
                        </button>
                        `;

const scriptHtml = `
    <script>
        function toggleTheme() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-bs-theme', newTheme);
            document.querySelectorAll('#themeIcon').forEach(icon => {
                if(newTheme === 'light') {
                    icon.classList.remove('bi-moon-fill');
                    icon.classList.add('bi-sun-fill');
                } else {
                    icon.classList.remove('bi-sun-fill');
                    icon.classList.add('bi-moon-fill');
                }
            });
        }
        function toggleRTL() {
            const isRtl = document.documentElement.getAttribute('dir') === 'rtl';
            document.documentElement.setAttribute('dir', isRtl ? 'ltr' : 'rtl');
        }
    </script>
</body>
`;

files.forEach(file => {
    const filePath = path.join(dir, file);
    let content = fs.readFileSync(filePath, 'utf-8');

    // Safely remove previously added toggles/script if they exist
    content = content.replace(/<!-- Toggles -->[\s\S]*?RTL\s*<\/button>\s*/, '');
    content = content.replace(/<script>\s*function toggleTheme\([\s\S]*?<\/script>\s*<\/body>/, '</body>');
    
    // Insert toggle buttons
    content = content.replace(/<div class="d-none d-sm-flex/, toggleHtml + '<div class="d-none d-sm-flex');

    // Insert script before </body>
    content = content.replace(/<\/body>/, scriptHtml);

    fs.writeFileSync(filePath, content);
});
console.log('Updated all HTML files.');
