// Pitaara - Custom JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Update copyright year
    document.getElementById('current-year').textContent = new Date().getFullYear();
    
    // Music player functionality
    const playPauseBtn = document.getElementById('playPauseBtn');
    const progressBar = document.querySelector('.progress-bar');
    let isPlaying = false;
    
    if (playPauseBtn) {
        playPauseBtn.addEventListener('click', function() {
            isPlaying = !isPlaying;
            
            // Change icon based on play state
            if (isPlaying) {
                playPauseBtn.innerHTML = '<i class="bi bi-pause-fill fs-3"></i>';
                // Simulate progress bar movement
                simulateProgress();
            } else {
                playPauseBtn.innerHTML = '<i class="bi bi-play-fill fs-3"></i>';
                // Stop progress simulation
                clearInterval(progressInterval);
            }
        });
    }
    
    let progressInterval;
    let progressValue = 0;
    
    function simulateProgress() {
        clearInterval(progressInterval);
        progressValue = 0;
        progressBar.style.width = '0%';
        
        progressInterval = setInterval(() => {
            progressValue += 0.5;
            progressBar.style.width = progressValue + '%';
            
            if (progressValue >= 100) {
                clearInterval(progressInterval);
                isPlaying = false;
                playPauseBtn.innerHTML = '<i class="bi bi-play-fill fs-3"></i>';
            }
        }, 100);
    }
    
    // Track list play buttons
    const trackPlayButtons = document.querySelectorAll('.list-group-item .btn');
    
    trackPlayButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            
            // Reset all icons
            trackPlayButtons.forEach(btn => {
                btn.innerHTML = '<i class="bi bi-play-fill fs-5"></i>';
            });
            
            // Set this to pause icon
            this.innerHTML = '<i class="bi bi-pause-fill fs-5"></i>';
            
            // Start playing in the main player
            if (playPauseBtn) {
                playPauseBtn.innerHTML = '<i class="bi bi-pause-fill fs-3"></i>';
                isPlaying = true;
                simulateProgress();
            }
            
            // Get track info
            const trackItem = this.closest('.list-group-item');
            const trackTitle = trackItem.querySelector('h5').textContent;
            const trackArtist = trackItem.querySelector('p').textContent;
            const trackImage = trackItem.querySelector('img').src;
            
            // Update main player
            const mainPlayerImage = document.querySelector('.card-img-top');
            const mainPlayerTitle = document.querySelector('.position-absolute h3');
            const mainPlayerArtist = document.querySelector('.position-absolute p');
            
            if (mainPlayerImage) mainPlayerImage.src = trackImage;
            if (mainPlayerTitle) mainPlayerTitle.textContent = trackTitle;
            if (mainPlayerArtist) mainPlayerArtist.textContent = trackArtist;
            
            // Highlight selected track
            document.querySelectorAll('.list-group-item').forEach(item => {
                item.classList.remove('active-track');
            });
            trackItem.classList.add('active-track');
        });
    });
    
    // Dropdown selection functionality
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    
    dropdownItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const dropdownButton = this.closest('.dropdown').querySelector('button');
            dropdownButton.textContent = this.textContent;
        });
    });
});
