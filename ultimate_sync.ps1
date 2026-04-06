$files = Get-ChildItem -Filter *.html

$masterHeader = @"
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="index.html">
                    <i class="bi bi-shield-lock me-2 fs-3"></i>
                    <span>Antique Mapping</span>
                </a>

                <div class="d-flex align-items-center order-lg-3">
                    <!-- Toggles (Visible only on Large Desktop) -->
                    <div class="d-none d-xl-flex align-items-center gap-2 me-2">
                        <button class="btn btn-link text-decoration-none" onclick="toggleTheme()" type="button" aria-label="Toggle theme">
                            <i class="bi bi-moon-fill fs-5" id="themeIcon"></i>
                        </button>
                        <button class="btn btn-link text-decoration-none fw-bold" onclick="toggleRTL()" type="button" aria-label="Toggle RTL">
                            <span id="rtlLabel">RTL</span>
                        </button>
                    </div>
                    
                    <div class="navbar-auth-buttons d-none d-xl-flex gap-2">
                        <a href="login.html" class="btn btn-primary">Login</a>
                        <a href="register.html" class="btn btn-outline-primary">Join</a>
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
                                Home
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
"@

$masterOffcanvas = @"
    <!-- Mobile Menu Offcanvas -->
    <div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="mobileMenu">
        <div class="offcanvas-header pb-0 border-bottom border-secondary border-opacity-25 py-3">
            <a class="navbar-brand d-flex align-items-center" href="index.html">
                <i class="bi bi-shield-lock me-2 fs-3 text-primary"></i>
                <span class="text-white">Antique Mapping</span>
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

            <!-- Mobile Toggles -->
            <div class="offcanvas-toggles border-top border-secondary border-opacity-25 pt-4 mb-4">
                <h6 class="text-uppercase small fw-bold text-secondary ls-2 mb-3">Settings</h6>
                <div class="d-flex gap-3">
                    <button class="btn btn-outline-secondary flex-grow-1 d-flex align-items-center justify-content-center gap-2" onclick="toggleTheme()" type="button">
                        <i class="bi bi-moon-fill" id="themeIcon"></i> Theme
                    </button>
                    <button class="btn btn-outline-secondary flex-grow-1 d-flex align-items-center justify-content-center gap-2" onclick="toggleRTL()" type="button">
                        <i class="bi bi-translate"></i> <span id="rtlLabel">RTL</span>
                    </button>
                </div>
            </div>

            <!-- Mobile Auth Section (Consolidated here for mobile views) -->
            <div class="mt-auto pt-4 border-top border-secondary border-opacity-25">
                <a href="login.html" class="btn btn-primary w-100 mb-2">Login</a>
                <a href="register.html" class="btn btn-outline-primary w-100">Join</a>
            </div>
        </div>
    </div>
"@

$masterFooter = @"
    <!-- Footer -->
    <footer class="mt-auto py-5">
        <div class="container">
            <div class="row g-5 mb-5 align-items-start">
                <div class="col-lg-4 text-center text-lg-start">
                    <a class="navbar-brand d-inline-flex align-items-center mb-4" href="index.html">
                        <i class="bi bi-shield-lock me-2 fs-3 text-primary"></i>
                        <span class="text-white">Antique Mapping</span>
                    </a>
                    <p class="text-secondary small mb-4">Elite curators and forensic auditors of historical cartography since 2008.</p>
                    <div class="d-flex footer-social-icons pt-2 justify-content-center justify-content-lg-start">
                        <a href="#" class="me-4"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="me-4"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="me-4"><i class="bi bi-twitter-x"></i></a>
                        <a href="#"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2 offset-lg-1 text-center text-md-start">
                    <h6 class="mb-4 fw-bold text-uppercase text-white ls-2">The Firm</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="about.html" class="text-secondary small text-decoration-none transition-smooth link-hover">About Protocol</a></li>
                        <li class="mb-2"><a href="services.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Expert Services</a></li>
                        <li class="mb-2"><a href="blog.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Intelligence Feed</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-2 text-center text-md-start">
                    <h6 class="mb-4 fw-bold text-uppercase text-white ls-2">Client Services</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="contact.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Secure Channel</a></li>
                        <li class="mb-2"><a href="pricing.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Asset Valuation</a></li>
                        <li class="mb-2"><a href="register.html" class="text-secondary small text-decoration-none transition-smooth link-hover">Credential Intake</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-3 text-center text-md-start">
                    <h6 class="mb-4 fw-bold text-uppercase text-white ls-2">Newsletter</h6>
                    <p class="text-secondary small mb-4 text-center text-md-start">Subscribe for declassified asset reports.</p>
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="EMAIL ADDRESS">
                        <button class="btn btn-primary px-3" type="button"><i class="bi bi-send text-black"></i></button>
                    </div>
                </div>
            </div>
            <hr class="border-secondary opacity-25">
            <div class="row align-items-center py-3">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-0 fs-tiny text-secondary">&copy; 2026 Antique Protocol Firm. All assets encrypted and secured.</p>
                </div>
                <div class="col-md-6 text-center text-md-end pt-3 pt-md-0">
                    <ul class="list-inline mb-0 fs-tiny text-secondary">
                        <li class="list-inline-item"><a href="#" class="ms-3 text-secondary text-decoration-none link-hover">Privacy_Policy</a></li>
                        <li class="list-inline-item"><a href="#" class="ms-3 text-secondary text-decoration-none link-hover">Terms_of_Engagement</a></li>
                        <li class="list-inline-item"><a href="#" class="ms-3 text-secondary text-decoration-none link-hover">Compliance_Matrix</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
"@

$headInitScript = @"
    <script>
        (function() {
            const savedTheme = localStorage.getItem('theme') || 'dark';
            const savedDir = localStorage.getItem('dir') || 'ltr';
            document.documentElement.setAttribute('data-bs-theme', savedTheme);
            document.documentElement.setAttribute('dir', savedDir);
            if (savedDir === 'rtl') {
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.rtl.min.css';
                document.head.appendChild(link);
            }
        })();
    </script>
"@

$scriptsHtml = @"
    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>
"@

foreach ($file in $files) {
    Write-Host "Syncing $($file.Name) (Aggressive)..."
    $content = Get-Content $file.FullName -Raw
    
    # 1. CLEANUP ALL EXISTING FRAGMENTS
    # Use (?si) for case-insensitive single-line (multiline dot)
    $content = [regex]::replace($content, "(?si)<!-- Header -->.*?<header>.*?</header>", "")
    $content = [regex]::replace($content, "(?si)<header>.*?</header>", "")
    $content = [regex]::replace($content, "(?si)<!-- Mobile Menu Offcanvas -->.*?<div class=`"offcanvas.*?</div>\s*</div>", "")
    $content = [regex]::replace($content, "(?si)<div class=`"offcanvas.*?</div>\s*</div>", "")
    $content = [regex]::replace($content, "(?si)<!-- Footer -->.*?<footer.*?>.*?</footer>", "")
    $content = [regex]::replace($content, "(?si)<footer.*?>.*?</footer>", "")
    $content = [regex]::replace($content, "(?si)<!-- Scripts -->.*?<script.*?</script>", "")
    $content = [regex]::replace($content, "(?si)<script.*?</script>", "")
    
    # Cleanup any lingering Login/Join/CTA rows (seen in SS)
    $content = [regex]::replace($content, "(?si)<div [^>]*class=`"[^`"]*(navbar-cta|auth-buttons|auth-section)[^`"]*`"[^>]*>.*?</div>", "")
    $content = [regex]::replace($content, "(?si)<div [^>]*class=`"[^`"]*row[^`"]*`"[^>]*>\s*<a [^>]*href=`"(login|register)\.html`"[^>]*>.*?</a>\s*</div>", "")

    # Cleanup multiple head script remnants
    $content = [regex]::replace($content, "(?si)<script>.*?localStorage\.getItem\('theme'\).*?</script>", "")

    $content = $content.Replace("</body>", "")
    $content = $content.Replace("</html>", "")
    $content = $content.Trim()

    # 2. APPLY COMPONENTS
    $isAuth = ($file.Name -eq "login.html" -or $file.Name -eq "register.html")
    
    # Re-wrap body tag to include master header and offcanvas
    if ($content -match "<body>") {
        $bodyPrefix = "<body>"
        if (-not $isAuth) {
            $bodyPrefix += "`r`n$masterHeader`r`n$masterOffcanvas"
        }
        $content = $content.Replace("<body>", $bodyPrefix)
    }

    # Add head script if missing
    if ($content -notmatch "savedTheme = localStorage") {
        $content = $content.Replace("</head>", "$headInitScript`r`n</head>")
    }

    # Add footer
    if (-not $isAuth) {
        $content += "`r`n$masterFooter"
    }
    
    $content += "`r`n$scriptsHtml`r`n</body>`r`n</html>"

    # Final cleanup of excessive newlines
    $content = [regex]::replace($content, "(\r?\n\s*){3,}", "`r`n`r`n")

    Set-Content $file.FullName $content -Encoding UTF8 -NoNewline
}

Write-Host "Ultimate Responsive Sync (Clean) complete."
