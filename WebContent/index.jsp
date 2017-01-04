<%-- Jalankan config utama --%>
<%@ include file="config/global.jsp" %>
<%-- Jalankan Session Helper --%>
<%@ include file="/helper/session_helper.jsp" %>
<%-- Include Header --%>
<%@ include file="views/header.jsp" %>
<%-- Include Content --%>
<title>Aperture Shop .:: Capture Every Moment ::.</title>
</head>
<body>
<%-- Include Main Menu --%>
<%@ include file="views/menu.jsp" %>
<hr>
<%@ include file="/helper/error_helper.jsp" %>
<div class="row">
    <div class="col-md-12 index-inner-shadow" style="background: url('<%= IMG_PATH %>2.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: 700px; margin-bottom: 10px;">
        <p class="text-center" style="margin-top: 50px; color: rgba(250, 139, 12, 1);">Welcome to Aperture Shop</p>
        <p class="text-center" style="font-size: 10px; color: rgba(250, 139, 12, 1);">Why Shop with Us?</p>
        <div class="row" style="margin-left: 20px; margin-right: 20px;">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail" style="min-height: 450px; height: 450px; overflow-y: scroll">
                    <img src="<%= IMG_PATH %>Content1.jpg" alt="content_1">
                    <div class="caption">
                        <h3>Photography Experience</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis metus massa. Phasellus viverra venenatis mauris, at porta nulla tincidunt nec. Phasellus et tellus enim. Maecenas sodales tellus eget egestas facilisis. Pellentesque vestibulum velit et auctor molestie. Suspendisse aliquet tincidunt ipsum, sed tempor mauris hendrerit sit amet. Praesent vitae ante ac ex suscipit porta ac at massa.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4"> 
                <div class="thumbnail" style="min-height: 450px; height: 450px; overflow-y: scroll">
                    <img src="<%= IMG_PATH %>Content2.jpeg" alt="content_2">
                    <div class="caption">
                        <h3>Plenty of Choices</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis metus massa. Phasellus viverra venenatis mauris, at porta nulla tincidunt nec. Phasellus et tellus enim. Maecenas sodales tellus eget egestas facilisis. Pellentesque vestibulum velit et auctor molestie. Suspendisse aliquet tincidunt ipsum, sed tempor mauris hendrerit sit amet. Praesent vitae ante ac ex suscipit porta ac at massa.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4"> 
                <div class="thumbnail" style="min-height: 450px; height: 450px; overflow-y: scroll">
                    <img src="<%= IMG_PATH %>Content3.jpg" alt="content_2">
                    <div class="caption">
                        <h3>Shopping Worldwide</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis metus massa. Phasellus viverra venenatis mauris, at porta nulla tincidunt nec. Phasellus et tellus enim. Maecenas sodales tellus eget egestas facilisis. Pellentesque vestibulum velit et auctor molestie. Suspendisse aliquet tincidunt ipsum, sed tempor mauris hendrerit sit amet. Praesent vitae ante ac ex suscipit porta ac at massa.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12 index-inner-shadow" style="background: url('<%= IMG_PATH %>1.jpg'); background-position:0 -70px;background-size: cover; background-attachment: fixed; background-repeat: no-repeat; height: 700px; margin-bottom: 10px;">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 bg-white" style="margin-top: 90px;">
                <p class="text-center">Our Location</p>
                <p class="text-center"><img src="<%= IMG_PATH %>Content3.jpg" alt="store_img" width="300" height="300"></p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis metus massa. Phasellus viverra venenatis mauris, at porta nulla tincidunt nec. Phasellus et tellus enim. Maecenas sodales tellus eget egestas facilisis. Pellentesque vestibulum velit et auctor molestie. Suspendisse aliquet tincidunt ipsum, sed tempor mauris hendrerit sit amet. Praesent vitae ante ac ex suscipit porta ac at massa.</p>
            </div>
        </div>
    </div>
</div>
<%-- Include Footer --%>
<%@ include file="views/footer.jsp" %>