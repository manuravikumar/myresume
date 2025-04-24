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

  let startX = 0;
  let isDragging = false;

  const wrapper = document.querySelector('.tech-carousel-wrapper');

  wrapper.addEventListener('touchstart', (e) => {
    startX = e.touches[0].clientX;
    isDragging = true;
  });

  wrapper.addEventListener('touchmove', (e) => {
    if (!isDragging) return;
    const deltaX = startX - e.touches[0].clientX;
    wrapper.scrollLeft += deltaX;
    startX = e.touches[0].clientX;
  });

  wrapper.addEventListener('touchend', () => {
    isDragging = false;
  });

});
