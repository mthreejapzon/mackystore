import { Controller } from 'stimulus';
import $ from 'jquery';

export default class extends Controller {
  static targets = ['sizeField', 'cartBtn'];

  connect() {
    const $sizeField = $(this.sizeFieldTarget);

    $sizeField.on('change', function() {
      const sizeId = $(this).val();
      const productId = $(this).attr('product');

      $.ajax({
        url: `/products/${productId}/size/${sizeId}/quantity`
      }).done(function(data) {
        $('.js-select-container').html('');
        $('.js-quantity-text').text(data.quantity || 0);
        let $content;

        if (data.quantity > 0) {
          $content = $('<select>', { class: 'form-control js-select' });

          for(let val = 1; val <= data.quantity; val++) {
            $("<option />", { value: val, text: val }).appendTo($content);
          }
        }

        $content.appendTo('.js-select-container')
      });
    });
  }
}
