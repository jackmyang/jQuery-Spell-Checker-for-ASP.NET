<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>jQuery spell checker for ASP.NET WebForm simple demo</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/spellchecker.css" />
	<style type="text/css">
	body {
		margin: 1em;
		font-family: 'lucida grande',helvetica,verdana,arial,sans-serif;
	}
	#textarea-example {
		width: 562px;
	}
	textarea {
		font-size: 90%;
		margin-bottom:10px;
		padding: 5px;
		border: 1px solid #999999;
		border-color: #888888 #CCCCCC #CCCCCC #888888;
		border-style: solid;
		height: 20em;
		width: 550px;
	}
	button {
		font-size: 90%;
		cursor: pointer;
	}
	.loading {
		padding: 0.5em 8px;
		display: none;
		font-size: small;
	}
	</style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="textarea-example">
		    <p>
			    <label for="text-content">
				    Add your own text and check the spelling.
			    </label>
		    </p>
		    <textarea id="text-content" rows="5" cols="25"></textarea>
		    <div>

			    <button id="check-textarea">
				    Check Spelling
			    </button>&nbsp;
			    <span class="loading">loading..</span>
		    </div>
	    </div>
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.2.min.js"></script>
	    <script type="text/javascript" src="js/jquery.spellchecker.js"></script>

	    <script type="text/javascript">

	        // check the spelling on a textarea
	        $("#check-textarea").click(function (e) {
	            e.preventDefault();
	            $(".loading").show();

	            $("#text-content")
			    .spellchecker({
			        url: "~/JQuerySpellCheckerHandler.ashx",    // only value different from original demo code using PHP
			        lang: "en",
			        engine: "google",
			        suggestBoxPosition: "above"
			    })
			    .spellchecker("check", function (result) {

			        // spell checker has finished checking words
			        $(".loading").hide();

			        // if result is true then there are no badly spelt words
			        if (result) {
			            alert('There are no incorrectly spelt words.');
			        }
			    });
	        });

	        // you can ignore this; if document is viewed via subversion in google code then re-direct to demo page
	        if (/jquery-spellchecker\.googlecode\.com/.test(window.location.hostname) && /svn/.test(window.location)) {
	            window.location = 'http://spellchecker.jquery.badsyntax.co.uk/';
	        }
	    </script>
    </div>
    </form>
</body>
</html>
