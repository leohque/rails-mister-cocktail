import $ from 'jquery';
import 'select2';

const fancySelect = () => {
  $(document).ready(function() {
    $('.fancy-select').select2({
      placeholder: 'Select an option'
    });
  });
};

export { fancySelect };
