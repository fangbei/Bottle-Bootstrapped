/***  Bind typeahead.js

    DOCUMENTATION HTML
    
    <input type="text" data-bind="typeahead: thevalue, typeaheadSource: sourceFunction">
***/
ko.bindingHandlers.typeahead = {
    init: function (element, valueAccessor, allBindingsAccessor) {
        
        //var $hint = $( $e ).siblings(".tt-hint");
        
        //var allBindings = allBindingsAccessor();
        //var thevalue = valueAccessor();
        
        var self = this;
        var $e = $(element);

        self.theurl = allBindingsAccessor().typeaheadRemoteUrl || "/typeahead?name=null&value=%QUERY";

        //console.log( self.theurl , ko.bindingHandlers.typeahead.counter);

        var updateValues = function( datumObj ) {
            try {
                valueAccessor().value_caption( datumObj.value );
                valueAccessor().value_id( datumObj.id );
            }
            catch(err) {
            }
        };

        $e.attr("autocomplete", "off")
		.typeahead({
            /* DOCUMENTATION: https://github.com/twitter/typeahead.js */

            name: 'autocompletionholder' + (++ko.bindingHandlers.typeahead.counter),
            //local: [{value: 'Aaaaaa', tokens: ['aaaa', 'Aaa'], id: 4}, {value: 'Bbbbbb', tokens: ['bb', 'bbbb'], id: 5}, {value: 'cCcccc', tokens: ['cCcc', 'ccccc'], id: 6} ],
            remote: {
                    url: self.theurl,
                    filter: function( parseResponse ){
                            console.log(parseResponse);
                            var datums = [];
                            $.each( parseResponse["response"], function(ix, dict){
                                datums.push( {"value": dict["caption"], "id": dict["id"]} );
                            });
                            return datums;
                    },
                    xhrSending: function () {
                        //add loading class to tt-hint element when request sending.
                        console.log("typeahead sending...");
                        $('.tt-hint').css('background-image', 'url("/images/loading.gif")');
                        $('.tt-hint').css('background-position', '98% 0%');
                        $('.tt-hint').css('background-repeat', 'no-repeat no-repeat');
                        /*
                        $($(".twitter-typeahead")[0]).find(".tt-hint").css('background-image', '');
                        $($(".twitter-typeahead")[0]).find(".tt-hint").css('background-position', '98% 0%');
                        $($(".twitter-typeahead")[0]).find(".tt-hint").css('background-repeat', 'no-repeat no-repeat');
                        */
                    },
                    xhrDone: function () {
                        $('.tt-hint').css('background-image', '');
                        console.log("typeahead sending done!");
                    }
            }

            /*
            The individual units that compose datasets are called datums.
            The canonical form of a datum is an object with a value property and a tokens property.
            value is the string that represents the underlying value of the datum and
            tokens is a collection of single-word strings that aid typeahead.js in matching datums with a given query.
            */

        }).on('typeahead:selected', function (el, datumObj ) {
            /*Triggered when a suggestion from the dropdown menu is explicitly selected.
            The datum for the selected suggestion is passed to the event handler as an argument in addition to the name of the dataset it originated from.*/

            updateValues( datumObj );

        }).on('typeahead:autocompleted', function (el, datumObj ) {
            /*Triggered when the query is autocompleted.
            The datum used for autocompletion is passed to the event handler as an argument in addition to the name of the dataset it originated from.*/

            //updateValues( datumObj );

        }).on('typeahead:initialized', function (event, data) {
            // After initializing, hide the progress icon.
            //$('.tt-hint').css('background-image', '/images/loading.gif');
            //$('.tt-hint').css('background-image', '');
            //$('.tt-hint').css('background-position', '98% 0%');
            //$('.tt-hint').css('background-repeat', 'no-repeat no-repeat');
        }).on('typeahead:opened', function (el, datumObj){
            //$('.tt-hint').css('background-image', '');
        });
    },
    counter: 0,
};



/*** Bind jquery-ui.js datepicker ***/
ko.bindingHandlers.datepicker = {
    init: function (element, valueAccessor, allBindingsAccessor) {
        //initialize datepicker with some optional options
        var options = allBindingsAccessor().datepickerOptions || {};

        var funcOnSelectdate = function () {
            var observable = valueAccessor();
            observable($(element).datepicker("getDate"));
        }
        options.onSelect = funcOnSelectdate;

        $(element).datepicker(options);

        //handle the field changing
        ko.utils.registerEventHandler(element, "change", funcOnSelectdate);

        //handle disposal (if KO removes by the template binding)
        ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
            $(element).datepicker("destroy");
        });

    },
    update: function (element, valueAccessor) {
        var value = ko.utils.unwrapObservable(valueAccessor());

        current = $(element).datepicker("getDate");

        if (value - current !== 0) {
            $(element).datepicker("setDate", value);
        }
    }
};


/*** DOCUMENTATION
<input data-bind="datepicker: myDateObservAble, datepickerOptions: { minDate: new Date() }" >
<input data-bind="datepicker: myDate, datepickerOptions: { minDate: new Date(), maxDate: new Date() }">

myDateObservAble = ko.observable(new Date("12/01/2013"));

***/

/*** Bind bootstrap.js tooltip ***/
ko.bindingHandlers.tooltip = {
    update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
        var $element, options, tooltip;

        options = ko.utils.unwrapObservable(valueAccessor());
        $element = $(element);
        tooltip = $element.data('tooltip');

        if(tooltip){
            $.extend(tooltip.options, options);
        }else{
            $element.tooltip(options);
        }
    }
};