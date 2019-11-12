<%@ page import="models.Comment" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Lectio</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-grid.css" rel="stylesheet">
    <link href="css/bootstrap-reboot.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aldrich">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alfa+Slab+One">
    <link rel="stylesheet" href="css/Features-Clean.css">
    <link rel="stylesheet" href="css/Footer-Dark.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="css/Projects-Horizontal.css">
    <link rel="stylesheet" href="css/Simple-Slider.css">
    <link rel="stylesheet" href="css/styles.css">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css?family=Atomic+Age|Monoton|Raleway:900&display=swap" rel="stylesheet">

</head>

<body>
<%@ include file="/jsp/navbar.jsp" %>
<div class="container-fluid">
    <div class="video-container">
        <div class="row">
            <div class="col-8">
                <div class="video">
                    <iframe allowfullscreen="" frameborder="0"
                            src="${video.url}" class=""></iframe>
                </div>
                <br>
                <div class="row video-info">
                    <div class="col">
                        <span><h2>${video.name}</h2></span>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <span>${video.views} просмотров | ${video.upload_date}</span>
                    </div>
                    <div class="col-md-6 d-flex flex-row-reverse align-items-center">
                        <button type="button" class="btn btn-primary btn-sm" style="margin-left: 10px;">Add in
                            favorite
                        </button>
                        <button type="button" class="btn btn-primary btn-sm">Like</button>
                        <span class="likes-count">${video.likes} Likes</span>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-3">
                        <div class="small-channel-info d-flex d-lg-inline">
                            <img src="assets/img/1.jpg" alt="channel logo" class="small-channel-image"
                                 style="width: 50px; height: 50px;">
                            <span>Channel name</span>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="video-description">
                        <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut tortor pretium viverra suspendisse potenti nullam ac. Dictum non consectetur a erat. Leo vel orci porta non pulvinar. Risus commodo viverra maecenas accumsan lacus. Aliquet risus feugiat in ante metus dictum at tempor commodo. Et netus et malesuada fames ac. Justo donec enim diam vulputate. Nunc scelerisque viverra mauris in aliquam sem. Diam maecenas ultricies mi eget mauris. Malesuada fames ac turpis egestas maecenas pharetra convallis.</span>
                    </div>
                </div>
                <hr>
                <h4>Comments</h4>

                <div class="comments">
                    <h3 class="title-comments">Comments </h3>
                    <ul class="media-list">

                        <% List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                            for (Comment comment : comments) {
                                int id_com = comment.getId();
                                String text = comment.getText();
                                Date date = comment.getDate();
                                String username = comment.getUserName();
                                String img = comment.getImg();
                        %>
                        <li class="media">
                            <div class="media-left">
                                <a>
                                    <img class="media-object img-thumbnail" src="<%= img %>" alt="...">
                                </a>
                            </div>
                            <div class="media-body">
                                <div class="media-heading">
                                    <div class="author"><%= username %>
                                    </div>
                                    <div class="metadata">
                                        <span class="date"><%=date %></span>
                                    </div>
                                </div>
                                <div class="media-text text-justify"><%= text %>
                                </div>
                            </div>
                            <hr>
                        </li>
                        <%}%>

                    </ul>
                    <div class="media-body">
                        <div class="media-heading">
                            <div class="author">You</div>
                            <div class="metadata">
                                <span class="date">Now</span>
                            </div>
                            <div class="media-text text-justify">
                                <form action="/video" method="post">
                                    <span>Comment</span><br>
                                    <textarea id="comment" name="text" cols="80" rows="7"></textarea><br>
                                    <button name="send" id="send" value="">Send</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    </tbody>
                    </table>
                </div>

                <%--<div class="form-group">--%>
                <%--<form action="" class="d-flex d-flex">--%>
                <%--<input type="text" class="form-control" placeholder="Write a comment" style="margin-right: 10px;">--%>
                <%--<input type="submit" class="btn btn-primary" value="Send">--%>
                <%--</form>--%>
                <%--</div>--%>
                <%--<hr>--%>
                <%--<div class="comment-card">--%>
                <%--<div class="row">--%>
                <%--<div class="col">--%>
                <%--<span><h5>Username</h5></span>--%>
                <%--<small>Publish date</small>--%>
                <%--<div class="col comment-text">--%>
                <%--<span>Phasellus egestas tellus rutrum tellus pellentesque eu. Id faucibus nisl tincidunt eget nullam non nisi est. Malesuada pellentesque elit eget gravida cum sociis.</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--<div class="comment-card">--%>
                <%--<div class="row">--%>
                <%--<div class="col">--%>
                <%--<span><h5>Username</h5></span>--%>
                <%--<small>Publish date</small>--%>
                <%--<div class="col comment-text">--%>
                <%--<span>Phasellus egestas tellus rutrum tellus pellentesque eu. Id faucibus nisl tincidunt eget nullam non nisi est. Malesuada pellentesque elit eget gravida cum sociis.</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--<div class="comment-card">--%>
                <%--<div class="row">--%>
                <%--<div class="col">--%>
                <%--<span><h5>Username</h5></span>--%>
                <%--<small>Publish date</small>--%>
                <%--<div class="col comment-text">--%>
                <%--<span>Phasellus egestas tellus rutrum tellus pellentesque eu. Id faucibus nisl tincidunt eget nullam non nisi est. Malesuada pellentesque elit eget gravida cum sociis.</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--<div class="comment-card">--%>
                <%--<div class="row">--%>
                <%--<div class="col">--%>
                <%--<span><h5>Username</h5></span>--%>
                <%--<small>Publish date</small>--%>
                <%--<div class="col comment-text">--%>
                <%--<span>Phasellus egestas tellus rutrum tellus pellentesque eu. Id faucibus nisl tincidunt eget nullam non nisi est. Malesuada pellentesque elit eget gravida cum sociis.</span>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="col-4" style="padding-left: 30px;">
                    <form action="/video" method="post">
                        <div class="form-group">
                        <textarea class="form-control"
                                  style="width: 100%;height: 200px;margin-right: 20px;"
                                  name="noteText"></textarea>
                            <button name="save" class="btn btn-primary" type="submit"
                                    style="margin: 0px;margin-top: 20px;">Button
                            </button>
                        </div>
                    </form>
                    <hr>
                    <div>
                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="small-video-card">
                            <div class="row" style="padding: 0px;">
                                <div class="col-md-6">
                                    <img src="assets/img/1.jpg" alt="" class="card-img-left">
                                </div>
                                <div class="col" style="padding: 0">
                                    <div>
                                        <h6>Video name</h6>
                                        <small>${authorName}</small>
                                        <br>
                                        <small>${likes} likes</small>
                                        <br>
                                        <small>${videoTopic}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/Simple-Slider.js"></script>
</div>
</body>

</html>