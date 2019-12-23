// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('hello controller');
    $("#send-packages").click(function() {
    let body = $('#package_body').val();
    $(this).attr("disabled", "disabled");
    body = $('#package_body').val();
    $.ajax({
        url: '/api/v1/packages',
        dataType: 'json',
        type: 'post',
        contentType: 'application/json',
        data: body,
        processData: false,
        success: function( data, textStatus, jQxhr ){
           console.log(data)
           window.location.replace("/packages");
        },
        error: function( jqXhr, textStatus, errorThrown ){
            console.log( errorThrown );
        }
    });
  });
  }
}
