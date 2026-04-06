import os

injection_html = '''
        <!-- Expert Appraisal Section -->
        <section class="py-5 bg-dark border-top border-secondary border-opacity-25">
            <div class="container py-lg-5">
                <div class="row align-items-center g-5">
                    <div class="col-lg-6 order-lg-2">
                        <img src="assets/images/historical_map_analysis.png" class="img-fluid rounded shadow-lg" alt="Historical Map Analysis" style="height: 400px; width: 100%; object-fit: cover;">
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="pe-lg-4 text-center text-lg-start">
                            <span class="badge bg-primary text-black mb-3 fs-tiny text-uppercase px-3 py-2">Service Matrix</span>
                            <h2 class="display-5 fw-bold mb-4 text-white">Expert Evaluation & Authenticity Protocols.</h2>
                            <p class="lead text-secondary mb-4">Leveraging deep historical context, our dedicated curators employ advanced forensic measures to authenticate your rare maps.</p>
                            <ul class="list-unstyled text-secondary mb-5 ms-md-3">
                                <li class="mb-3 d-flex align-items-center justify-content-center justify-content-lg-start"><i class="bi bi-patch-check text-primary me-3 fs-5"></i> High-resolution microscopic analysis.</li>
                                <li class="mb-3 d-flex align-items-center justify-content-center justify-content-lg-start"><i class="bi bi-patch-check text-primary me-3 fs-5"></i> Archival pigment testing.</li>
                                <li class="d-flex align-items-center justify-content-center justify-content-lg-start"><i class="bi bi-patch-check text-primary me-3 fs-5"></i> Absolute lineage certification.</li>
                            </ul>
                            <a href="services.html" class="btn btn-outline-primary px-5 py-3">View Full Protocol</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- The Vault Section -->
        <section class="py-5 bg-black py-lg-5 border-top border-secondary border-opacity-25">
            <div class="container py-lg-4 text-center">
                <div class="row justify-content-center mb-5">
                    <div class="col-lg-8">
                        <h2 class="display-4 fw-bold text-uppercase text-theme">The Collector's Arsenal.</h2>
                        <p class="lead text-secondary mt-3">Elite navigational instruments and drafting tools from the golden age of discovery. We procure beyond just parchment.</p>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="position-relative overflow-hidden rounded shadow-lg">
                            <img src="assets/images/antique_cartography_tools.png" class="img-fluid w-100 transition-smooth hover-zoom" alt="Cartography Tools" style="height: 500px; object-fit: cover;">
                            <div class="position-absolute bottom-0 start-0 w-100 p-4 bg-dark bg-opacity-75 text-start">
                                <h4 class="text-white fw-bold mb-1">Antique Calipers & Drafting Compass</h4>
                                <p class="text-secondary small mb-0">Declassified from a private 17th-century European royal collection.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-5 text-center">
                    <a href="pricing.html" class="btn btn-primary px-5 py-3 btn-hover-accent">Explore Physical Assets</a>
                </div>
            </div>
        </section>
'''

files = [
    'index.html', 'about.html', 'blog.html', 'contact.html',
    'home-2.html', 'pricing.html', 'services.html', 'login.html', 'register.html'
]

for file in files:
    with open(file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # insert before </main>
    if '</main>' in content:
        # Check if already injected
        if "Expert Appraisal Section" not in content:
            content = content.replace('</main>', injection_html + '\n    </main>')
            with open(file, 'w', encoding='utf-8') as f:
                f.write(content)
            print("Updated " + file)
        else:
            print("Skipped " + file + " (already injected)")
    else:
        print("Could not find </main> in " + file)
