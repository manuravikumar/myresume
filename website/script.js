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
  