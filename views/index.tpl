<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Bottle Bootstrapped site using bottle.py jquery.js bootstrap.js knockout.js bootstrap.css">

    ##Favorite Icon
    <link rel="shortcut icon" type="image/x-icon" href="/icons/favicon.ico">
    
    <title>Bottle Bootstrapped</title>

    ##Include CSS template
    <%include file="/views/css.tpl" />

</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
      
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">Bottle Bootstrapped</a>
    </div>

    <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="/">Home</a></li>
            ##<li><a href="#about">About</a></li>
            ##<li><a href="#contact">Contact</a></li>
          </ul>
    </div><!--/.nav-collapse -->
      
    </div>
</div>

<div class="container" role="main">
    
    <div class="well custom-well">

    ##<p>Index of site. ${context.get("sitename", "")}</p>

    <h4>Backend # Model with python # View with python and HTML5</h4>

    <h5><a class="custom" href="https://github.com/defnull/bottle">Bottle</a> <span class="pull-right">[MIT Licence]</span></h5>
    
    <p>Bottle is a fast, simple and lightweight WSGI micro web-framework for Python. It is distributed as a single file module and has no dependencies other than the Python Standard Library. Can be used as a Model View backend. 
    </p>
    
    <h5><a class="custom" href="http://www.makotemplates.org">Mako Template</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p>
    Template engine to use within bottle to create views.
    </p>
    
    <h5><a class="custom" href="https://twistedmatrix.com/trac">Twisted</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p> Event-driven networking engine written in Pythonweb engine to use within bottle to handle the web requests. Twisted also supports many common network protocols, including SMTP, POP3, IMAP, SSHv2, and DNS.</p>
    
    <h4>Frontend # Model and View with Knockout</h4>

    <h5><a class="custom" href="https://github.com/jquery/jquery">jQuery</a> <span class="pull-right">[MIT Licence]</span></h5> 
    <p>JavaScript top layer. AJAX and DOM methods. And much more!</p>
    
    <h5><a class="custom" href="https://github.com/twbs/bootstrap">Bootstrap</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p>HTML5 style sheet helper and javascript methods to speed production.</p>

    <h5><a class="custom" href="https://github.com/knockout/knockout">Knockout</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p>Model View frontend. JavaScript library that makes it easier to create rich user interfaces with JavaScript and HTML. It uses observers to make your UI automatically stay in sync with an underlying data model, along with a powerful and extensible set of declarative bindings to enable productive development.
    </p>

    <a class="custom" href="https://www.github.com/thedemz">www.github.com/thedemz/Bottle-Bootstrapped</a>

    </div>

</div>

<div class="container">
    <div class="well custom-well">

    <h4>Extra JavaScript Libraries</h4>

    <h5><a class="custom" href="https://github.com/jquery/jquery-ui">jQuery-UI</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p>
         jQuery UI is a curated set of user interface interactions, effects, widgets, and themes built on top of the jQuery JavaScript Library.
    </p>

    <h5><a class="custom" href="https://datatables.net">DataTables</a> <span class="pull-right">[BSD Licence]</span></h5>
    <p>
        DataTables is a plug-in for the jQuery Javascript library, which will add advanced interaction controls to any HTML table.
    </p>

    <h5><a class="custom" href="https://github.com/moment/moment">Moment</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p>
         A lightweight javascript date library for parsing, validating, manipulating, and formatting dates.
    </p>

    <h5><a class="custom" href="https://github.com/twitter/typeahead.js">Typeahead</a><span class="pull-right">[MIT Licence]</span></h5>
    <p>
         typeahead.js is a flexible JavaScript library that provides a strong foundation for building robust typeaheads.
    </p>

    <h5><a class="custom" href="https://github.com/mbostock/d3">D3</a> <span class="pull-right">[MIT Licence]</span></h5>

    <p>
        D3 stands for Data-Driven Documents and is awesome in creating all sorts of plots and mutch more.
    </p>

    
    <h5><a class="custom" href="https://code.google.com/p/google-code-prettify">Prettify</a> <span class="pull-right">[Apache Licence 2.0]</span></h5>

    <p>
        A Javascript module and CSS file that allows syntax highlighting of source code snippets in an html page.
    </p>
    </div>

</div>

<div class="container">
    <div class="well custom-well">

    <h4>Databases</h4>

    <h5><a class="custom" href="http://www.sqlite.org">SQLite</a> <span class="pull-right">[Public Domain]</span></h5>
    <p>
         SQLite is a software library that implements a self-contained, serverless, zero-configuration, transactional SQL database engine.
    </p>

    <h5><a class="custom" href="http://www.postgresql.org">Posgresql</a> <span class="pull-right">[PostgreSQL License]</span></h5>
    <p>
        An open-source object-relational database management system (ORDBMS) with an emphasis on extensibility and standards-compliance. It is released under the PostgreSQL License, a free/open source software license, similar to the MIT License.
    </p>

    <h5><a class="custom" href="http://www.sqlalchemy.org">SQLAlchemy</a> <span class="pull-right">[MIT Licence]</span></h5>
    <p>
         Top layer implemented in python to handle databases and wrap objects with databases. SQLAlchemy is the Python SQL toolkit and Object Relational Mapper that gives application developers the full power and flexibility of SQL. It provides a full suite of well known enterprise-level persistence patterns, designed for efficient and high-performing database access, adapted into a simple and Pythonic domain language.
    </p>

</div>

##Include JavaScript template
<%include file="/views/js.tpl" />

</body>
</html>


