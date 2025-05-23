document.addEventListener('DOMContentLoaded', () => {
  const sections = document.querySelectorAll('main section');
  sections.forEach((section, i) => {
    section.style.opacity = '0';
    section.style.transform = 'translateY(20px)';
    setTimeout(() => {
      section.style.transition = 'all 0.8s ease-out';
      section.style.opacity = '1';
      section.style.transform = 'translateY(0)';
    }, 200 + i * 200);
  });
});
  
document.addEventListener('DOMContentLoaded', () => {
  const buttons = document.querySelectorAll('.tab-btn');
  const contents = document.querySelectorAll('.tab-content');

  buttons.forEach(button => {
    button.addEventListener('click', () => {
      // Remove active from all
      buttons.forEach(btn => btn.classList.remove('active'));
      contents.forEach(content => content.classList.remove('active'));

      // Add active to selected
      button.classList.add('active');
      const tabId = button.getAttribute('data-tab');
      document.getElementById(tabId).classList.add('active');
    });
  });
});
document.addEventListener("DOMContentLoaded", function () {
  const wrapper = document.querySelector('.tech-carousel-wrapper');
  const track = document.querySelector('.tech-carousel-track');

  let startX = 0;
  let isDragging = false;

  wrapper.addEventListener('touchstart', (e) => {
    track.style.animationPlayState = 'paused'; // pause auto scroll
    startX = e.touches[0].clientX;
    isDragging = true;
  });

  wrapper.addEventListener('touchmove', (e) => {
    if (!isDragging) return;
    const deltaX = e.touches[0].clientX - startX;
    wrapper.scrollLeft -= deltaX;
    startX = e.touches[0].clientX;
  });

  wrapper.addEventListener('touchend', () => {
    isDragging = false;
    track.style.animationPlayState = 'running'; // resume scroll
  });
});


document.addEventListener("DOMContentLoaded", () => {
  const visitorEl = document.getElementById("visitor-logs");

  fetch("https://resume-visitor-api.azurewebsites.net/api/visitors")
    .then(res => res.json())
    .then(data => {
      if (!data.visitors && data.visitors !== 0) {
        visitorEl.innerText = "No visitor data found.";
        return;
      }

      visitorEl.innerHTML = `<p>Total visitors (last 24h): <strong>${data.visitors}</strong></p>`;
    })
    .catch(err => {
      console.error("Visitor fetch error:", err);
      visitorEl.innerText = "Failed to load visitor data.";
    });
});
