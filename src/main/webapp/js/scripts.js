document.addEventListener('DOMContentLoaded', function() {
    // Update tab title when changing tabs
    const navLinks = document.querySelectorAll('.sidebar .nav-link');
    const mainTitle = document.querySelector('h1.h2');
    
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            // Update main title based on the clicked tab
            if (mainTitle) {
                mainTitle.textContent = this.textContent.trim();
            }
            
            // Mark only the clicked tab as active
            navLinks.forEach(navLink => {
                navLink.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
    
    // Initialize select-all checkboxes
    const selectAllCheckboxes = document.querySelectorAll('input[id^="selectAll"]');
    selectAllCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const tableBody = this.closest('table').querySelector('tbody');
            const checkboxes = tableBody.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(cb => {
                cb.checked = this.checked;
            });
        });
    });
    
    // Enable tooltips
    try {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    } catch (e) {
        console.warn('Bootstrap Tooltip initialization error:', e);
    }
    
    // Form validation
    const forms = document.querySelectorAll('.needs-validation');
    
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            form.classList.add('was-validated');
        }, false);
    });
    
    // Media library grid/list view toggle
    const gridViewBtn = document.querySelector('.media-library .btn-grid');
    const listViewBtn = document.querySelector('.media-library .btn-list');
    const mediaContainer = document.querySelector('.media-container');
    
    if (gridViewBtn && listViewBtn && mediaContainer) {
        gridViewBtn.addEventListener('click', function() {
            mediaContainer.classList.remove('list-view');
            mediaContainer.classList.add('grid-view');
            gridViewBtn.classList.add('active');
            listViewBtn.classList.remove('active');
        });
        
        listViewBtn.addEventListener('click', function() {
            mediaContainer.classList.remove('grid-view');
            mediaContainer.classList.add('list-view');
            listViewBtn.classList.add('active');
            gridViewBtn.classList.remove('active');
        });
    }
    
    // Dashboard charts - if we have Chart.js loaded
    if (typeof Chart !== 'undefined') {
        // Artists by type chart
        try {
            const artistsChartCtx = document.getElementById('artistsByTypeChart');
            if (artistsChartCtx) {
                new Chart(artistsChartCtx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Singers', 'Actors', 'Dancers', 'Painters', 'Others'],
                        datasets: [{
                            data: [45, 25, 15, 10, 5],
                            backgroundColor: [
                                '#9B87F5',
                                '#FFBD99',
                                '#63C7FF',
                                '#FFD166',
                                '#9E9E9E'
                            ]
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'bottom'
                            }
                        }
                    }
                });
            }
        } catch (e) {
            console.warn('Chart initialization error:', e);
        }
    }
    
    // Search functionality
    const searchInputs = document.querySelectorAll('input[placeholder*="Search"]');
    searchInputs.forEach(input => {
        input.addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                const searchTerm = this.value.toLowerCase();
                const table = this.closest('.card').querySelector('table');
                if (!table) return;
                
                const rows = table.querySelectorAll('tbody tr');
                rows.forEach(row => {
                    const text = row.textContent.toLowerCase();
                    if (text.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }
        });
    });
    
    // Add row functionality
    const addRowButtons = document.querySelectorAll('.btn-add-row');
    addRowButtons.forEach(button => {
        button.addEventListener('click', function() {
            const row = this.closest('.input-group');
            const newRow = row.cloneNode(true);
            
            // Clear input values
            newRow.querySelectorAll('input').forEach(input => {
                input.value = '';
            });
            
            // Change button to remove
            const btnGroup = newRow.querySelector('.btn');
            btnGroup.innerHTML = '<i class="bi bi-trash"></i>';
            btnGroup.classList.remove('btn-outline-secondary');
            btnGroup.classList.add('btn-outline-danger');
            btnGroup.addEventListener('click', function() {
                this.closest('.input-group').remove();
            });
            
            // Insert after current row
            row.parentNode.insertBefore(newRow, row.nextSibling);
        });
    });
    
    // Mobile sidebar toggle
    const sidebarToggler = document.querySelector('.navbar-toggler');
    if (sidebarToggler) {
        sidebarToggler.addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('show');
        });
    }
    
    // Update timestamps to relative time
    const timeElements = document.querySelectorAll('.time-ago');
    timeElements.forEach(el => {
        const timestamp = new Date(el.getAttribute('datetime'));
        const now = new Date();
        const diffMs = now - timestamp;
        const diffMins = Math.floor(diffMs / 60000);
        
        if (diffMins < 60) {
            el.textContent = diffMins + ' mins ago';
        } else if (diffMins < 1440) {
            el.textContent = Math.floor(diffMins / 60) + ' hours ago';
        } else {
            el.textContent = Math.floor(diffMins / 1440) + ' days ago';
        }
    });
});

// Copy to clipboard function
function copyToClipboard(text, button) {
    navigator.clipboard.writeText(text).then(() => {
        const originalText = button.innerHTML;
        button.innerHTML = '<i class="bi bi-check"></i> Copied!';
        button.classList.add('btn-success');
        button.classList.remove('btn-outline-secondary');
        
        setTimeout(() => {
            button.innerHTML = originalText;
            button.classList.remove('btn-success');
            button.classList.add('btn-outline-secondary');
        }, 2000);
    }).catch(err => {
        console.error('Failed to copy text: ', err);
    });
}

// Delete confirmation handler
function confirmDelete(itemType, itemName) {
    return confirm(`Are you sure you want to delete ${itemType} "${itemName}"? This action cannot be undone.`);
}

// Filter table rows by category
function filterTable(tableId, filterValue, columnIndex) {
    const table = document.getElementById(tableId);
    const rows = table.querySelectorAll('tbody tr');
    
    rows.forEach(row => {
        const cell = row.querySelectorAll('td')[columnIndex];
        if (!cell) return;
        
        if (filterValue === 'all' || cell.textContent.trim() === filterValue) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}