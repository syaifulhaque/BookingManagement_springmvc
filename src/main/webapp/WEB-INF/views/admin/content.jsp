<#include "header.jsp"/>
<#include "sidebar.jsp" />		
<div id="main-content"> <!-- Main Content Section with everything -->
    <noscript> <!-- Show a notification if the user has disabled javascript -->
    <div class="notification error png_bg">
        <div>
            Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
        </div>
    </div>
    </noscript>
    <#if messageSuccess??>
	<div class="notification success png_bg">
		<a href="#" class="close"><img
			src="<@spring.url '/assets/resource/images/icons/cross_grey_small.png'/>"
			title="Close this notification" alt="close" /></a>
		<div>
			${messageSuccess!}
		</div>
	</div>
	</#if>
    <#if messageFailed??>
    <div class="notification error png_bg">
        <a href="#" class="close"><img
                src="<@spring.url '/assets/resource/images/icons/cross_grey_small.png'/>"
                title="Close this notification" alt="close" /></a>
        <div>${messageFailed!}</div>
    </div>
    </#if>
    <!-- Page Head -->
    <h2>Welcome ${userLogin!}</h2>
    <p id="page-intro">What would you like to do?</p>
    
    <#include "footer.jsp"/>	
