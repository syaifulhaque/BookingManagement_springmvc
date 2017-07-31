<#import "/spring.ftl" as spring />
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <title>Login to the Booker area .</title>
    <link rel="stylesheet" href="assets/resource/css/style-red.css">
    <body>
        <style type="text/css">
            .error {
                background: #ffcece;
                border-color: #df8f8f;
                color: #665252;
                position: relative;
                padding: 10px;
                font-size: 13px;
                width: 99.8%;
            }
        </style>

        <#if messageFailed??>
        <div class="error">
            <a href="#" class="close"><img
                    src="assets/resource/images/icons/cross_grey_small.png"
                    title="Close this notification" alt="close" /></a>
            <div>
                ${messageFailed!}
            </div>
        </div>
        </#if>

        <div class="off-canvas-wrap" data-offcanvas="">
            <div class="inner-wrap">
                <!-- ***** Full page screen ***** -->
                <section class="full-page-section" id="loginSection"
                         style="height: 599px;">
                    <div class="inner">
                        <div class="row">
                            <div class="medium-6 medium-offset-3 columns">
                                <div class="row">
                                    <div class="medium-4 columns"></div>
                                    <div class="medium-8 columns">
                                        <h1>Login</h1>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="medium-4 columns login-pic">
                                        <img alt="" src="assets/resource/images/flight.jpeg">
                                    </div>
                                    <form action="<@spring.url '/login' />" method="post" modelAttribute="usersBean">
                                        <div class="medium-8 columns">
                                            <div class="row collapse">
                                                <div class="small-9 columns">
                                                    <#if username??>
                                                    <div class="error">${username!}</div>
                                                    </#if>
                                                    <@spring.formInput 'usersBean.username', 'placeholder="Username"'/>
                                                </div>
                                            </div>

                                            <div class="row collapse">

                                                <div class="small-9 columns">
                                                    <#if password??>
                                                    <div class="error">${password!}</div>
                                                    </#if>
                                                    <@spring.formPasswordInput 'usersBean.password', 'placeholder="Password"'/>	
                                                </div>
                                            </div>
                                            <input type="submit" name="login" class="button" />
                                        </div>
                                        <div style="display: none" class="cffm_applied"></div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>