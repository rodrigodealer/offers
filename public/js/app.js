var template = '{{#offers}} \
                <div class="row"> \
                  <div class="col-md-1"> \
                    <img src="{{thumbnail.lowres}}" class="img-thumbnail" /> \
                  </div> \
                  <div class="col-md-10"> \
                    <h2>{{title}}</h2> \
                    {{#payout}} \
                    <p>{{teaser}}</p> \
                    <p>Payout: $ {{payout}}</p> \
                    <p><a class="btn btn-default" href="{{link}}" role="button">View details &raquo;</a></p> \
                    {{/payout}} \
                  </div> \
                </div> \
                {{/offers}}';

var loadOffers = function () {
  $.ajax({
    url: "/offers?" + $("form").serialize()
  }).done(function (data) {
    var offers = {"offers": [{"title": "No offers available"}] };
    if (data.code === "OK") offers = data;
    $("#offers").html(Mustache.render(template, offers));
  });
};
