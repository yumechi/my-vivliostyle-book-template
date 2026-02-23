module.exports = {
  title: 'My Book',
  author: 'yumechi',
  language: 'ja',
  size: 'A5',
  theme: '@vivliostyle/theme-techbook',
  entry: [
    { path: 'manuscripts/index.md', title: '表紙' },
    { path: 'manuscripts/chapter-01.md', title: '第1章 はじめに' },
    { path: 'manuscripts/afterword.md', title: 'あとがき' },
    { path: 'manuscripts/colophon.md', title: '奥付' },
  ],
  output: ['./output/book.pdf'],
};
