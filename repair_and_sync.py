import os
import re

# Master Components
master_head_script = """
    <script>
        // Apply theme and direction immediately to avoid flash
        (function() {
            const savedTheme = localStorage.getItem('theme') || 'dark';
            const savedDir = localStorage.getItem('dir') || 'ltr';
            document.documentElement.setAttribute('data-bs-theme', savedTheme);
            document.documentElement.setAttribute('dir', savedDir);
        })();
    </script>
"""

master_header = """
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-xl fixed-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="index.html">
                    <i class="bi bi-shield-lock me-2 fs-3"></i>
                    <span>Antique Mapping</span>
                </a>

                <div class="d-flex align-items-center order-xl-3">
                    <!-- Desktop Toggles (Visible for XL screens) -->
                    <div class="d-none d-xl-flex align-items-center gap-3 me-3">
                        <button class="btn btn-link text-theme p-0" onclick="toggleTheme()" type="button" aria-label="Toggle theme">
                            <i class="bi bi-moon-fill fs-5" id="themeIcon"></i>
                        </button>
                        <button class="btn btn-link text-theme p-0" onclick="toggleRTL()" type="button" aria-label="Toggle RTL">
                            <i class="bi bi-translate fs-5"></i>
                        </button>
                    </div>

                    <div class="d-none d-xl-flex align-items-center gap-2 navbar-cta">
                        <a href="login.html" class="btn btn-outline-primary">Login</a>
                        <a href="register.html" class="btn btn-primary">Join</a>
                    </div>
                    
                    <!-- Hamburger (Visible for screens <= 1199px) -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#mobileMenu">
                        <i class="bi bi-list fs-4"></i>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="homeDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Home <i class="bi bi-chevron-down ms-1 small"></i>
                            </a>
                            <ul class="dropdown-menu border-0 shadow-lg" aria-labelledby="homeDropdown">
                                <li><a class="dropdown-item" href="index.html">Home 1</a></li>
                                <li><a class="dropdown-item" href="home-2.html">Home 2</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                        <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
"""

master_offcanvas = """
    <!-- Mobile Menu Offcanvas -->
    <div class="offcanvas offcanvas-start bg-dark text-theme" tabindex="-1" id="mobileMenu">
        <div class="offcanvas-header pb-0 border-bottom border-secondary border-opacity-25 py-3">
            <a class="navbar-brand d-flex align-items-center" href="index.html">
                <i class="bi bi-shield-lock me-2 fs-3 text-primary"></i>
                <span class="text-theme">Antique Mapping</span>
            </a>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="nav flex-column mb-4 mt-4">
                <li class="nav-item">
                    <a class="nav-link d-flex justify-content-between align-items-center" data-bs-toggle="collapse" href="#homeSubmenu" role="button" aria-expanded="false" aria-controls="homeSubmenu">
                        Home <i class="bi bi-chevron-down"></i>
                    </a>
                    <div class="collapse ps-3" id="homeSubmenu">
                        <ul class="nav flex-column">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home 1</a></li>
                            <li class="nav-item"><a class="nav-link" href="home-2.html">Home 2</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="services.html">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <!-- Mobile Auth Section -->
            <div class="offcanvas-auth-section border-top border-secondary border-opacity-25 pt-4 mb-3">
                <h6 class="text-uppercase small fw-bold text-secondary ls-2 mb-3">Account</h6>
                <div class="d-flex flex-column gap-2 mb-3">
                    <a href="login.html" class="btn btn-outline-secondary justify-content-start d-flex align-items-center gap-2">
                        <i class="bi bi-person"></i> Login
                    </a>
                    <a href="register.html" class="btn btn-primary justify-content-start d-flex align-items-center gap-2">
                        <i class="bi bi-person-plus text-black"></i> <span class="text-black">Join Network</span>
                    </a>
                </div>
            </div>

            <!-- Settings Toggles -->
            <div class="offcanvas-toggles border-top border-secondary border-opacity-25 pt-4 mb-4">
                <h6 class="text-uppercase small fw-bold text-secondary ls-2 mb-3">Settings</h6>
                <div class="d-flex gap-3">
                    <button class="btn btn-outline-secondary d-flex align-items-center justify-content-center" style="width: 44px; height: 44px;" onclick="toggleTheme()" type="button" aria-label="Toggle theme">
                        <i class="bi bi-moon-fill fs-5" id="themeIcon"></i>
                    </button>
                    <button class="btn btn-outline-secondary d-flex align-items-center justify-content-center" style="width: 44px; height: 44px;" onclick="toggleRTL()" type="button" aria-label="Toggle RTL">
                        <i class="bi bi-translate fs-5"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
"""

master_footer = """
    <!-- Footer -->
    <footer class="mt-auto py-5">
        <div class="container">
            <div class="row g-5 mb-5 justify-content-center text-center">
                <!-- Branding and Social -->
                <div class="col-12">
                    <a class="navbar-brand d-inline-flex align-items-center mb-4" href="index.html">
                        <i class="bi bi-shield-lock me-2 fs-3 text-primary"></i>
                        <span class="text-theme">Antique Mapping</span>
                    </a>
                    <p class="text-secondary small mb-4 mx-auto" style="max-width: 600px;">Elite curators and forensic auditors of historical cartography since 2008.</p>
                    <div class="d-flex footer-social-icons pt-2 justify-content-center">
                        <a href="#"><i class="bi bi-facebook"></i></a>
                        <a href="#"><i class="bi bi-instagram"></i></a>
                        <a href="#"><i class="bi bi-twitter-x"></i></a>
                        <a href="#"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>

                <!-- Firm Section -->
                <div class="col-12 col-md-4 mb-4 mb-md-0">
                    <h6 class="mb-4 fw-bold text-uppercase text-theme ls-2">The Firm</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="about.html" class="text-secondary small text-decoration-none transition-smooth link-hover">About Protocol</a></li>
                        <li class="mb-2"><a href="services.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Expert Services</a></li>
                        <li class="mb-2"><a href="blog.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Intelligence Feed</a></li>
                    </ul>
                </div>

                <!-- Client Services Section -->
                <div class="col-12 col-md-4 mb-4 mb-md-0">
                    <h6 class="mb-4 fw-bold text-uppercase text-theme ls-2">Client Services</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="contact.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Secure Channel</a></li>
                        <li class="mb-2"><a href="pricing.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Asset Valuation</a></li>
                        <li class="mb-2"><a href="register.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Credential Intake</a></li>
                    </ul>
                </div>

                <!-- Newsletter Section -->
                <div class="col-12 col-md-4">
                    <h6 class="mb-4 fw-bold text-uppercase text-theme ls-2">Newsletter</h6>
                    <p class="text-secondary small mb-4">Subscribe for declassified asset reports.</p>
                    <div class="input-group mx-auto" style="max-width: 320px;">
                        <input type="email" class="form-control" placeholder="EMAIL ADDRESS">
                        <button class="btn btn-primary px-3" type="button"><i class="bi bi-send text-black"></i></button>
                    </div>
                </div>
            </div>

            <hr class="border-secondary opacity-25">

            <!-- Bottom Bar -->
            <div class="row align-items-center py-3">
                <div class="col-12 text-center">
                    <p class="mb-3 fs-tiny text-secondary">&copy; 2026 Antique Protocol Firm. All assets encrypted and secured.</p>
                    <ul class="list-inline mb-0 fs-tiny text-secondary">
                        <li class="list-inline-item"><a href="#" class="mx-3 text-secondary text-decoration-none link-hover">Privacy_Policy</a></li>
                        <li class="list-inline-item"><a href="#" class="mx-3 text-secondary text-decoration-none link-hover">Terms_of_Engagement</a></li>
                        <li class="list-inline-item"><a href="#" class="mx-3 text-secondary text-decoration-none link-hover">Compliance_Matrix</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

"""

master_body_script = """
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        function updateUI() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const currentDir = document.documentElement.getAttribute('dir');
            
            // Update Theme Icons
            document.querySelectorAll('#themeIcon').forEach(icon => {
                if(currentTheme === 'light') {
                    icon.classList.replace('bi-moon-fill', 'bi-sun-fill');
                } else {
                    icon.classList.replace('bi-sun-fill', 'bi-moon-fill');
                }
            });

            // Update RTL Labels
            document.querySelectorAll('#rtlLabel').forEach(label => {
                label.textContent = currentDir === 'rtl' ? 'LTR' : 'RTL';
            });
        }

        function toggleTheme() {
            const currentTheme = document.documentElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-bs-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            updateUI();
        }

        function toggleRTL() {
            const currentDir = document.documentElement.getAttribute('dir');
            const newDir = currentDir === 'rtl' ? 'ltr' : 'rtl';
            document.documentElement.setAttribute('dir', newDir);
            localStorage.setItem('dir', newDir);
            updateUI();
        }

        // Initialize UI on load
        document.addEventListener('DOMContentLoaded', updateUI);
    </script>
</body>
"""

files = [f for f in os.listdir('.') if f.endswith('.html')]

for file_name in files:
    print(f"Repairing {file_name}...")
    with open(file_name, 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Fix head corruption (PowerShell mess and multiple scripts)
    content = re.sub(r'<script>\s*// Apply theme and direction.*?</script>', '', content, flags=re.DOTALL)
    content = re.sub(r'</head>["@\s=]+<body>', '</head>\\n<body>', content) # Fix the PowerShell artifact
    content = content.replace('</head>', master_head_script + '</head>')
    
    # 2. Sync Header
    content = re.sub(r'<!-- Header -->.*?<header>.*?</header>', master_header, content, flags=re.DOTALL)
    if '<header>' not in content:
         content = content.replace('<body>', '<body>' + master_header)

    # 3. Sync Offcanvas
    content = re.sub(r'<!-- Mobile Menu Offcanvas -->.*?<div class="offcanvas.*?</div>\s*</div>', master_offcanvas, content, flags=re.DOTALL)
    if 'offcanvas' not in content:
        if '</header>' in content:
            content = content.replace('</header>', '</header>' + master_offcanvas)
        else:
            content = content.replace('<body>', '<body>' + master_offcanvas)

    # 4. Sync Footer
    auth_pages = ['login.html', 'register.html']
    footer_pattern = r'<!-- Footer -->.*?<footer.*?>.*?</footer>'
    
    if file_name not in auth_pages:
        if re.search(footer_pattern, content, flags=re.DOTALL):
            content = re.sub(footer_pattern, master_footer, content, flags=re.DOTALL)
        else:
            # If no footer found, add it before main scripts block or end of body
            if '<!-- Scripts -->' in content:
                content = content.replace('<!-- Scripts -->', master_footer + '\n    <!-- Scripts -->')
            elif '</main>' in content:
                content = content.replace('</main>', '</main>\n' + master_footer)
            else:
                content = content.replace('</body>', master_footer + '\n</body>')
    else:
        # For auth pages, remove any footer if it mistakenly exists
        content = re.sub(footer_pattern, '', content, flags=re.DOTALL)

    # 5. Fix missing </body> and Sync Scripts
    # Remove existing scripts blocks to avoid duplicates - very aggressive cleanup
    content = re.sub(r'<!-- Scripts -->.*?<script.*?bootstrap.*?></script>', '', content, flags=re.DOTALL)
    content = re.sub(r'<!-- Scripts -->.*?</body>', '</body>', content, flags=re.DOTALL)
    
    # Remove any stray script blocks that match the master ones
    content = re.sub(r'<script>\s*function updateUI\(.*?</script>', '', content, flags=re.DOTALL)
    content = re.sub(r'<script>\s*function updateIcons\(.*?</script>', '', content, flags=re.DOTALL)
    content = re.sub(r'<script>\s*function toggleTheme\(.*?</script>', '', content, flags=re.DOTALL)
    content = re.sub(r'<script>\s*function toggleRTL\(.*?</script>', '', content, flags=re.DOTALL)
    content = re.sub(r'<script>\s*function updateLinks\(.*?</script>', '', content, flags=re.DOTALL)
    
    # Remove duplicate bootstrap/main.js loads
    content = re.sub(r'<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>', '', content)
    content = re.sub(r'<script src="assets/js/main.js"></script>', '', content)
    
    # Final cleanup of any stray tags that might have been left by bad scripts
    content = content.replace('</body>', '')
    content = content.replace('</html>', '')
    
    # Append the master script and end tags
    content = content.strip() + "\n" + master_body_script + "</html>"

    # Save
    with open(file_name, 'w', encoding='utf-8') as f:
        f.write(content)

print("All HTML files repaired and standardized.")
