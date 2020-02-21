import $ from 'jquery';
import 'select2';

const initSelect2 = () => {

  window.alert("loaded select2");

  $('.select2').select2();
};

export { initSelect2 };
