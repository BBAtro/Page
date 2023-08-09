import Trix from "trix"
import 'trix/dist/trix.css';

const editor = document.querySelector('trix-editor');
const toolbarOptions = {
  toolbar: [
      ['bold', 'italic', 'link'], // Пример кнопок форматирования текста
      ['heading1', 'heading2', 'heading3'], // Пример кнопок заголовков
      ['quote', 'code', 'unorderedList', 'orderedList'], // Пример кнопок списков и цитат
      // ['insertImage', 'attachFiles'] // Пример кнопок для работы с медиа-файлами
  ]
};

new Trix.Editor(editor, toolbarOptions);