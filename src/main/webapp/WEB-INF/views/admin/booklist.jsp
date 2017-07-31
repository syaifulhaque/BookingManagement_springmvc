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
    <h2>Book List</h2>
    <p id="page-intro">List of Flight Booking History</p>
    <form action="<@spring.url '/index/booklist'/>" >
    <h3>Search :</h3>
    <div> Customer Name : <input type="text" name="cstName"></input>
        <button type="submit" value="Search">Search</button>
    </div>
    <br />
    <div class="content-box-content">

        <div class="tab-content default-tab" id="tab1">
            <!-- This is the target div. id must match the href of this div's tab -->
            <table>
                <thead>
                    <tr>
                        <th>Book Id</th>
                        <th>Customer Name</th>
                        <th>Flight From</th>
                        <th>Flight To</th>
                        <th>Flight Class</th>
                        <th>Total Passenger</th>
                        <th>Flight Price</th>
                        <th>Amount Paid</th>
                        <th>Booking Time</th>
                        <th>Edit</th>
                    </tr>

                </thead>
                <tbody>
                    <#list bookList.pageList as bl>
                    <tr>
                        <td>${bl.bookId!}</td>
                        <td>${bl.customerName!}</td>
                        <td>${bl.flightId.source!}</td>
                        <td>${bl.flightId.destination!}</td>  
                        <td>${bl.flightId.flightClass!}</td>
                        <td>${bl.totalPassenger!}</td>
                        <td>${bl.flightId.flightCharges!}</td>
                        <td>${bl.totalPassenger*bl.flightId.flightCharges!}</td>
                        <td>${bl.bookTimestamp!}</td>
                        <td>
                            <!-- Icons -->
                            <a href="<@spring.url '/index/deletebook?bookId=${bl.bookId!}'/>" 
                               onclick="return confirm('Are You really want to Delete ?');"
                               title="Delete">
                                <img src="<@spring.url '/assets/resource/images/icons/cross.png' />" alt="Delete" />
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


                    <#if bookList.pageCount=1> Prev 1 Next <#else> <#if
                    bookList.firstPage=true> Prev <#else>
                    <a href="<@spring.url '/admin/booklist?type=prev'/>">Prev</a>
                    </#if> <#list 0..bookList.pageCount-1 as pa> <#if
                    pa=bookList.page> ${pa+1} <#else>
                    <a href="<@spring.url '/admin/booklist?type=${pa}'/>">${pa+1}</a>
                    </#if> </#list> <#if bookList.lastPage=true> Next <#else>
                    <a href="<@spring.url '/admin/booklist?type=next'/>">Next</a>
                    </#if> </#if>

                </ul>
            </div>
                    </form>
            <!-- End #tab1 -->
            <div class="clear"></div>
            <#include "footer.jsp"/>	
