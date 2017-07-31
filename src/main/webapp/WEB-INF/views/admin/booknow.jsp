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
    <h2>Flight List</h2>
    <p id="page-intro">List of Flight Schedule</p>
    <form action="<@spring.url '/index/booklist'/>" >
    
    <div class="content-box-content">

        <div class="tab-content default-tab" id="tab1">
            <!-- This is the target div. id must match the href of this div's tab -->
            <table>
                <thead>
                    <tr>
                        <th>Flight Name</th>
                        <th>Flight From</th>
                        <th>Flight To</th>
                        <th>Flight Class</th>
                        <th>Seats</th>
                        <th>Price</th>
                        <th>Departure Time</th>
                        <th>Arrival Time</th>
                        <th>Action</th>
                    </tr>

                </thead>
                <tbody>
                    <#list flightList.pageList as fl>
                    <tr>
                        <td>${fl.flightName!}</td>
                        <td>${fl.source!}</td>
                        <td>${fl.destination!}</td>  
                        <td>${fl.flightClass!}</td>
                        <td>${fl.seats!}</td>
                        <td>${fl.flightCharges!}</td>
                        <td>${fl.departureTime!}</td>
                        <td>${fl.arrivalTime!}</td>
                        <td>
                            <!-- Icons -->
                            <a href="<@spring.url '/index/bookflight?flightId=${fl.flightId!}'/>" 
                               onclick="return confirm('Are You really want to Book this?');"
                               title="Delete">
                                <img src="<@spring.url '/assets/resource/images/icons/booknow.gif' />" alt="Delete" />
                            </a>
                        </td>
                    </tr>
                    </#list>

                </tbody>

            </table>

            <!--here will be navigation-->
            <div id="pagination" style="float: right;">
                <ul class="tsc_pagination">
                    <!-- Show pagination links -->


                    <#if flightList.pageCount=1> Prev 1 Next <#else> <#if
                    flightList.firstPage=true> Prev <#else>
                    <a href="<@spring.url '/admin/book?type=prev'/>">Prev</a>
                    </#if> <#list 0..flightList.pageCount-1 as pa> <#if
                    pa=flightList.page> ${pa+1} <#else>
                    <a href="<@spring.url '/admin/book?type=${pa}'/>">${pa+1}</a>
                    </#if> </#list> <#if flightList.lastPage=true> Next <#else>
                    <a href="<@spring.url '/admin/book?type=next'/>">Next</a>
                    </#if> </#if>

                </ul>
            </div>
                    </form>
            <!-- End #tab1 -->
            <div class="clear"></div>
            <#include "footer.jsp"/>	
