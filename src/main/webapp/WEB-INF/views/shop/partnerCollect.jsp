<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <style type="text/css">
  	:root {
		  /* Primary Colors */
		  --bc: #0c0c0d;
		  --bc-gray: #0d0e10;
		  --bc-purple: #1e2731;
		  --bc-purple-darker: #181c23;
		  --bc-nav-foot: #101317;
		  --section: #0e0e10;
		  --primary: #94c2e3;
		  --secondary: #4888b5;
		  /* Colors */
		  --white: #ffffff;
		  --black: #000000;
		  --dark-blue: #1f2029;
		  --extra-dark-blue: #13141a;
		  --red: #da2c4d;
		  --orange: #fd7e14;
		  --yellow: #f8ab37;
		  --warning: #ffc107;
		  --green: #28a745;
		  --light-green: #24e33a;
		  --teal: #20c997;
		  --cyan: #17a2b8;
		  --blue: #007bff;
		  --indigo: #6610f2;
		  --purple: #6f42c1;
		  --pink: #e83e8c;
		  --light-gray: #ebecf2;
		  --bright-gray: #d9d5de;
		  --gray: #6c757d;
		  --gray-extra-dark: #343a40;
		  --dark: #343a40;
		  /* Minecraft Colors */
		  --m-darkred: #aa0000;
		  --m-red: #ff5555;
		  --m-gold: #ffaa00;
		  --m-yellow: #ffff55;
		  --m-green: #55ff55;
		  --m-darkgreen: #00aa00;
		  --m-darkaqua: #00aaaa;
		  --m-aqua: #55ffff;
		  --m-blue: #94c2e3;
		  --m-darkblue: #0000aa;
		  --m-purple: #aa00aa;
		  --m-pink: #ff55ff;
		  --m-gray: #aaaaaa;
		  --m-darkgray: #555555;
		  /* Gradients */
		  --gradient: linear-gradient(45deg, rgba(148,194,227,1) 0%, rgba(72,136,181,1) 100%);
		  --gradient2: linear-gradient(45deg, rgba(148,194,227,1) 0%, rgba(72,136,181,1) 100%);
		  /* Sizes */
		  --heading: 3.4rem;
		  --heading-medium: 2rem;
		  --paragraph: 1.1rem;
		  --button-large: 1.6rem;
		  --button-small: 1.2rem;
		  --button-smallest: 1rem;
		  /* Fonts */
		  --font-main: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
		  --font-secondary: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
		  --font-slim: "Roboto";
		}
		* {
		  box-sizing: border-box;
		}
		
		html, body {
		  margin: 0;
		  width: 100%;
		  min-height: 100vh;
		  overflow-x: hidden;
		  font-family: var(--font-main);
		  scroll-behavior: smooth;
		  -webkit-font-smoothing: antialiased;
		}
		main {
		  min-height: 100vh;
		}
		/* Classes */
		/* ScrollTop */
		.back-to-top {
		  position: fixed;
		  right: 30px;
		  bottom: 30px;
		  display: none;
		  z-index: 98;
		}
		.back-to-top a svg {
		  fill: var(--bc-purple);
		}
		.back-to-top a {
		  display: block;
		  padding: 10px;
		  cursor: pointer;
		  opacity: 0;
		  transition: all .35s ease-in-out;
		}
		.back-to-top a:hover {
		  transform: scale(1.1, 1.1);
		}
		/* Space */
		.space {
		  min-height: 15vh;
		}
		.large-space {
		  min-height: 35vh;
		}
		/* Global Classes */
		.flexbox {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		.flexbox-col {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  flex-direction: column;
		}
		/* Normal classes */
		/* Menu */
		#menu {
		  top: 4.5em;
		  width: 100%;
		  display: none;
		  grid-template-columns: 1fr 21.66% 21.66% 21.66% 1fr;
		  position: fixed;
		  overflow: hidden;
		  z-index: 450;
		}
		.menu-left-space {
		  display: inline-block;
		  grid-column: 1;
		}
		.menu-right-space {
		  display: inline-block;
		  grid-column: 5;
		}
		.menu-left {
		  display: inline-block;
		  grid-column: 2;
		  color: var(--white);
		}
		.menu-left h3 {
		  margin: 0 .75em .5em .75em;
		}
		.menu-center {
		  display: inline-block;
		  grid-column: 3;
		  color: var(--white);
		}
		.menu-center h3 {
		  margin: 0 .75em .5em .75em;
		}
		.menu-right {
		  display: inline-block;
		  grid-column: 4;
		  color: var(--white);
		}
		.menu-right h3 {
		  margin: 0 .75em .5em .75em;
		}
		/* Menu Items */
		.menu-items {
		  margin: 0 .75em;
		  padding: 0 0 2em 0;
		  list-style-type: none;
		  display: flex;
		  justify-content: flex-start;
		  align-items: flex-start;
		  flex-direction: column;
		}
		.menu-item {
		  margin: .45em 0;
		  line-height: 0;
		  color: var(--white);
		  font-size: 1.22rem;
		  font-weight: 300;
		  cursor: pointer;
		}
		.menu-item-inner {
		  margin: 0;
		  text-decoration: none;
		  color: var(--white);
		  transition: color .3s;
		}
		.menu-item-inner:hover {
		  color: var(--primary);
		}
		.menu-item-inner::after {
		  border-bottom: 2px solid #ddd;
		  content: '';
		  display: block;
		  position: relative;
		  left: 0;
		  top: 6px;
		  transition: width .3s;
		  width: 0;
		}
		.menu-item-inner:hover::after {
		  width: 102%;
		}
		.menu-item-inner-active {
		  margin: 0;
		  text-decoration: none;
		  color: var(--white);
		}
		.menu-item-inner-active::after {
		  border-bottom: 2px solid #ddd;
		  content: '';
		  display: block;
		  position: relative;
		  left: 0;
		  top: 14px;
		  transition: width .3s;
		  width: 100%;
		}
		.user-icon-wrapper {
		  width: 100px;
		  position: absolute;
		  z-index: 12;
		}
		.user-icon {
		  width: 100%;
		  display: block;
		  border-radius: 50%;
		  z-index: 12;
		  border: 1px solid gray;
		}
		.user-header-inner {
		  z-index: 5;
		  width: 100%;
		  height: 100%;
		  position: relative;
		  overflow: hidden;
		}
		.user-header-overlay {
		  width: 100%;
		  height: 100%;
		  position: absolute;
		  z-index: 6;
		}
		.user-header {
		  width: 100%;
		  height: 100%;
		}
		.username-wrapper {
		  width: 100%;
		  position: relative;
		}
		.username-dev {
		  margin: 0;
		  display: inline-block;
		  color: black;
		  font-size: 2em;
		  cursor: default;
		}
		.uname-verified {
		  margin: 0 0 0 .25em;
		  width: 25px;
		  cursor: default;
		}
		.verified {
		  width: 100%;
		  color: var(--black);
		  background-color: var(--white);
		  font-family: var(--font-slim);
		  text-transform: uppercase;
		  letter-spacing: .05em;
		  font-weight: 900;
		  text-align: center;
		  border-radius: 5px;
		  font-size: 1em;
		  padding: .25em;
		  position: absolute;
		  pointer-events: none;
		  top: 150%;
		  left: 0;
		  opacity: 0;
		  transition: all .5s cubic-bezier(.175,.885,.32,1.275);
		}
		.verified::before {
		  content: "";
		  display: block;
		  width: 0;
		  height: 0;
		  transform: rotateZ(-90deg);
		  border-top: 12px solid transparent;
		  border-bottom: 12px solid transparent;
		  border-left: 12px solid var(--white);
		  position: absolute;
		  top: -15px;
		  left: 50%;
		}
		.user-info-bar {
		  width: 100%;
		  display: grid;
		  padding: .75em 0 1em 0;
		  grid-template-columns: 1fr 10% 35% 20% 1fr;
		  grid-template-rows: auto;
		  grid-template-areas:
		          ".ufo-bar-col1 .ufo-bar-col2 .ufo-bar-col3 .ufo-bar-col4 .ufo-bar-col5";
		}
		.ufo-bar-col2-inner {
		  display: flex;
		  position: relative;
		  justify-content: center;
		  align-items: center;
		}
		.ufo-bar-col3-inner {
		  display: flex;
		  padding: .5em 0;
		  position: relative;
		  justify-content: flex-start;
		  align-items: center;
		}
		.username-wrapper-outer {
		  display: flex;
		  margin: 0 0 0 1.5em;
		  justify-content: center;
		  flex-direction: column;
		  align-items: flex-start;
		}
		.ufo-bar-bio {
		  color: var(--gray);
		}
		.ufo-bar-col3-inner {
		  width: 100%;
		  height: 100%;
		}
		.ufo-bar-fff {
		  margin: .25em .5em 0 0;
		  color: var(--dark);
		  display: inline-block;
		  text-decoration: none;
		  cursor: pointer;
		}
		.ufo-bar-fff span {
		  color: var(--dark);
		  font-weight: 600;
		}
		.ufo-bar-fff-active {
		  margin: .25em .5em;
		  color: var(--primary);
		  display: inline-block;
		  text-decoration: none;
		  cursor: pointer;
		}
		.ufo-bar-fff-active span {
		  font-weight: 600;
		}
		.ufo-bar-col4-inner {
		  width: 100%;
		  height: 100%;
		  display: flex;
		  justify-content: flex-end;
		  align-items: center;
		}
		.ufo-bar-col5 {
		}
		.user-info-bar2 {
		  width: 100%;
		  display: grid;
		  color: var(--white);
		  grid-template-columns: 19% 15.5% 15.5% 15.5% 15.5% 19%;
		  grid-template-rows: auto;
		  grid-template-areas:
		          ".ufo-bar2-col1 .ufo-bar2-col2 .ufo-bar2-col3 .ufo-bar2-col4 .ufo-bar2-col6 .ufo-bar2-col7";
		}
		.ufo-bar2-block-active {
		  position: relative;
		  cursor: default;
		}
		.ufo-bar2-block {
		  border-bottom: 3px solid #ddd;
		  cursor: pointer;
		}
		.ufo-bar2-block span {
		  margin: 0 .3em;
		  color: var(--dark);
		}
		.ufo-bar2-block h3 {
		  color: black;
		  font-weight: 500;
		}
		.ufo-bar2-block:after {
		  content:"";
		  background: #ddd;
		  background-size: 700%;
		  display: block;
		  height: 0;
		  width: 100%;
		  bottom: 0;
		}
		.ufo-bar2-col2-inner {
		  width: 100%;
		}
		.ufo-bar2-col3-inner {
		  width: 100%;
		}
		.ufo-bar2-col4-inner {
		  width: 100%;
		}
		.ufo-bar2-col5-inner {
		  width: 100%;
		}
		.ufo-bar2-col6-inner {
		  width: 100%;
		}
		/* Button 2 */
		.button2, .btn-secondary2 {
		  margin: 0 .4em;
		  position: relative;
		  cursor: pointer;
		  padding: .9em 1em;
		  letter-spacing: .1em;
		  text-align: center;
		  font-weight: 300;
		  color: var(--bc);
		  font-size: var(--button-small);
		  background: var(--gradient2);
		  background-size: 1100%;
		  border-radius: 50px;
		  border: none;
		  transform: scaleX(1);
		  transition: background-position 3s cubic-bezier(.455,.03,.515,.955),-webkit-transform .3s cubic-bezier(.175,.885,.32,1.275);
		  transition: transform .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955);
		  transition: transform .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955),-webkit-transform .3s cubic-bezier(.175,.885,.32,1.275);
		}
		.button2 {
		  transition: bottom .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955),-webkit-transform .3s cubic-bezier(.175,.885,.32,1.275);
		  transition: transform .3s cubic-bezier(.175,.885,.32,1.275),bottom .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955);
		  transition: transform .3s cubic-bezier(.175,.885,.32,1.275),bottom .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955),-webkit-transform .3s cubic-bezier(.175,.885,.32,1.275);
		}
		.button2, .button2 .btn-secondary2 {
		  background-position: 0 50%;
		  bottom: 0;
		}
		.button2 .btn-secondary2 {
		  left: 0;
		  width: 90%;
		  position: absolute;
		  filter: blur(16px);
		  opacity: .9;
		  z-index: -1;
		  transform: scale3d(.9, .9, 1);
		  transition: bottom .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955),-webkit-transform .3s cubic-bezier(.175,.885,.32,1.275),-webkit-filter .3s cubic-bezier(.175,.885,.32,1.275);
		  transition: transform .3s cubic-bezier(.175,.885,.32,1.275),filter .3s cubic-bezier(.175,.885,.32,1.275),bottom .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955);
		  transition: transform .3s cubic-bezier(.175,.885,.32,1.275),filter .3s cubic-bezier(.175,.885,.32,1.275),bottom .3s cubic-bezier(.175,.885,.32,1.275),background-position 3s cubic-bezier(.455,.03,.515,.955),-webkit-transform .3s cubic-bezier(.175,.885,.32,1.275),-webkit-filter .3s cubic-bezier(.175,.885,.32,1.275);
		}
		.button2:focus, .button2:hover {
		  transform: scale3d(1.1, 1.1, 1);
		  background-position: 100% 50%;
		  outline: none;
		  bottom: 2px;
		}
		.button2:focus .btn-secondary2, .button2:hover .btn-secondary2 {
		  background-position: 100% 50%;
		  filter: blur(25px);
		  bottom: -5px;
		}
		/* Selection */
		::selection {
		  color: var(--white);
		  background: var(--primary);
		}
		/* SCROLLBAR */
		::-webkit-scrollbar-track {
		      background-color: #F5F5F5;
		}
		::-webkit-scrollbar {
		      width: 12px;
		      background-color: #F5F5F5;
		}
		::-webkit-scrollbar-thumb {
		      background-color: var(--primary);
		}
		/* @keyframes */
		@keyframes menufade {
		  0% { opacity: 0; }
		  100% { opacity: 1; }
		}
		@keyframes menufade-back {
		  0% { opacity: 1; }
		  100% { opacity: 0; }
		}
		@keyframes header-btn {
		  0% { top: 0; }
		  50% { top: 8px; }
		  100% { top: 0; }
		}
		/* @media rules */
		@media (max-width: 1440px) {
		  #navbar {
		    grid-template-columns: 1fr 30% 45% 1fr;
		  }
		  #menu {
		    grid-template-columns: 1fr 25% 25% 25% 1fr;
		  }
		  .user-info-bar {
		    grid-template-columns: 1fr 13% 42% 20% 1fr;
		  }
		  .user-info-bar2 {
		    grid-template-columns: 1fr 18.75% 18.75% 18.75% 18.75% 1fr;
		  }
		}
		@media (max-width: 1024px) {
		  #navbar {
		    grid-template-columns: 1fr 25% 60% 1fr;
		  }
		  #menu {
		    grid-template-columns: 1fr 28.33% 28.33% 28.33% 1fr;
		  }
		  .user-info-bar {
		    grid-template-columns: 1fr 18% 46% 21% 1fr;
		  }
		  .user-info-bar2 {
		    grid-template-columns: 1fr 21.25% 21.25% 21.25% 21.25% 1fr;
		  }
		  .user-info-inner {
		    width: 80%;
		  }
		  .ufo-text {
		    display: none;
		  }
		  .ufo-num {
		    color: var(--white);
		  }
		  .fl-first {
		    margin: 0 1em 0 1em;
		  }
		  .fl-last {
		    margin: 0 1em 0 1em;
		  }
		  .button2, .btn-secondary2 {
		    letter-spacing: 0;
		    font-size: var(--button-smallest);
		  }
		}
		@media (max-width: 767px) {
		  #navbar {
		    grid-template-columns: 1fr 25% 65% 1fr;
		  }
		  #menu {
		    grid-template-columns: 1fr 30% 30% 30% 1fr;
		  }
		  .user-info-bar {
		    grid-template-columns: 1fr 21% 44% 25% 1fr;
		  }
		  .user-info-bar2 {
		    grid-template-columns: 1fr 23.75% 23.75% 23.75% 23.75% 1fr;
		  }
		  .user-info-inner {
		    width: 100%;
		  }
		  .username-dev {
		    font-size: 1.5em;
		  }
		  .uname-verified {
		    width: 19px;
		  }
		  .no-mob {
		    display: none;
		  }
		  .no-desk {
		    display: block;
		  }
		  .button2, .btn-secondary2 {
		    padding: .8em .8em;
		    letter-spacing: 0;
		  }
		}
		@media (max-width: 560px) {
		  #menu {
		    background-color: var(--bc);
		    grid-template-columns: 90%;
		    grid-template-rows: 1fr 1fr 1fr;
		    justify-content: center;
		    flex-direction: column;
		    align-items: center;
		  }
		  .menu-left {
		    grid-area: 1;
		  }
		  .menu-center {
		    grid-area: 2;
		  }
		  .menu-right {
		    grid-area: 3;
		  }
		  .menu-left-space {
		    display: none;
		  }
		  .menu-right-space {
		    display: none;
		  }
		  .username-dev {
		    font-size: 1.6em;
		  }
		  .uname-verified {
		    width: 21px;
		  }
		}
		@media (max-width: 420px) {
		  .username-dev {
		    font-size: 1.5em;
		  }
		  .uname-verified {
		    width: 20px;
		  }
		}
		
	  .grid-container {
	    display: grid;
	    grid-template-columns: repeat(4, 1fr); /* 4개의 열 */
	    gap: 20px; /* 각 그리드 아이템 간격 */
	    padding: 10px;
	    max-width: 1250px;
	    margin: 40px 19%;
	  }
	
	  .grid-item {
	    background-color: var(--white); /* 카드 배경 색 */
	    border: 1px solid var(--light-gray); /* 테두리 */
	    border-radius: 8px; /* 모서리 둥글게 */
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
	    overflow: hidden; /* 넘치는 콘텐츠 숨김 */
	    text-align: center; /* 중앙 정렬 */
	    padding: 15px;
	    cursor: pointer;
	  }
	
	  .content-thumbnail {
	    width: 100%; /* 이미지 너비 채우기 */
	    height: auto; /* 비율 유지 */
	    border-bottom: 1px solid var(--light-gray); /* 이미지 아래 테두리 */
	  }
	
	  .content-details {
	    padding: 10px 0;
	  }
	
	  .content-title {
	    font-size: 1.2rem; /* 제목 크기 */
	    font-weight: bold; /* 볼드체 */
	    color: var(--dark-blue);
	    margin: 5px 0;
	  }
	
	  .content-price,
	  .content-discount {
	    font-size: 1rem; /* 텍스트 크기 */
	    color: var(--gray);
	  }
  </style>
  <script type="text/javascript">
	  let navBtn1 = $('#button1');
	
	  navBtn1.click(function() {
	      if(navBtn1.hasClass('open')) {
	        navBtn1.toggleClass('open');
	        $('#menu').css("display", "none");
	      } else {
	        navBtn1.toggleClass('open');
	        $('#menu').css("display", "grid");
	      }
	  });
	
	  $(window).scroll(function() {
	      var scroll = $(window).scrollTop();
	        if (scroll <= 250) {
	          $(".back-to-top a").css("opacity", "0");
	        } else {
	          if (scroll >= 250) {
	            $(".back-to-top a").css("opacity", "1");
	          }
	        }
	  });
	
	  $('a[href*="#"]')
	
	      .not('[href="#"]')
	      .not('[href="#0"]')
	      .click(function(event) {
	
	          if (
	              location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
	              &&
	              location.hostname == this.hostname
	          ) {
	
	              var target = $(this.hash);
	              target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
	
	              if (target.length) {
	
	                  event.preventDefault();
	                  $('html, body').animate({
	                      scrollTop: target.offset().top
	                  }, 1000, function() {
	
	                      var $target = $(target);
	                      $target.focus();
	
	                      if ($target.is(":focus")) {
	                          return false;
	                      } else {
	                          $target.attr('tabindex','-1');
	                          $target.focus();
	                      }
	                  });
	              }
	          }
	      });
	
	  $(".username-wrapper").on({
	      mouseenter: function () {
	          $(".verified").css("opacity", "1");
	          $(".verified").css("top", "130%");
	      },
	      mouseleave: function () {
	          $(".verified").css("opacity", "0");
	          $(".verified").css("top", "150%");
	      }
	  });
  </script>
</head>
<body>
	<div style="height: 150px;"></div>
	<main>
	  <div class="user-header-wrapper flexbox">
	    <div class="user-header-inner flexbox">
	      <div class="user-header-overlay"></div>
	    </div>
	  </div>
	  <div class="user-info-bar">
	    <div class="ufo-bar-col1"></div>
	    <div class="ufo-bar-col2">
	      <div class="ufo-bar-col2-inner">
	        <div class="user-icon-wrapper">
	          <img class="user-icon" src="${ctp}/logo/${vo.logo}" alt="">
	        </div>
	      </div>
	    </div>
	    <div class="ufo-bar-col3">
	      <div class="ufo-bar-col3-inner">
	        <div class="username-wrapper-outer">
	          <div class="username-wrapper">
	            <div class="verified" style="opacity: 0; top: 150%;">
	              <p>Verified Account</p>
	            </div>
	            <h3 class="username-dev">${vo.company}</h3>
	            <c:if test="${vo.accept == 'YES'}">
	            	<i class="fas fa-check-circle" style="color: #28a745; margin-left: 5px;"></i>
	            </c:if>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="ufo-bar-col4">
	      <div class="ufo-bar-col4-inner"></div>
	    </div>
	    <div class="ufo-bar-col5"></div>
	  </div>
	  <div class="user-info-bar2 mt-4">
	    <div class="ufo-bar2-col1"></div>
	    <div id="ufo-home" class="ufo-bar2-col2 ufo-bar2-block">
	      <div class="ufo-bar2-col2-inner flexbox">
	        <span><i class="uil uil-trophy"></i></span>
	        <h3>홈</h3>
	      </div>
	    </div>
	    <div id="ufo-videos" class="ufo-bar2-col3 ufo-bar2-block">
	      <div class="ufo-bar2-col3-inner flexbox">
	      	<span><i class="uil uil-trophy"></i></span>
	        <h3>게시물</h3>
	      </div>
	    </div>
	    <div id="ufo-images" class="ufo-bar2-col4 ufo-bar2-block">
	      <div class="ufo-bar2-col4-inner flexbox">
	        <span><i class="uil uil-user"></i></span>
	        <h3>카테고리</h3>
	      </div>
	    </div>
	    <div id="ufo-about" class="ufo-bar2-col6 ufo-bar2-block">
        <div class="ufo-bar2-col6-inner flexbox">
          <span><i class="uil uil-user"></i></span>
          <h3>커뮤니티</h3>
        </div>
      </div>
	    <div class="ufo-bar2-col7"></div>
	  </div>
	  <div class="grid-container">
	    <c:forEach var="vo" items="${shopVOS}">
	      <div class="grid-item" onclick="location.href='${ctp}/shop/shopContent?idx=${vo.idx}'">
          <img class="content-thumbnail" src="${ctp}/category/${vo.thumbnail}" alt="Thumbnail">
          <div class="content-details">
            <h4 class="content-title">${vo.title}</h4>
            <p class="content-price">Price: <span><fmt:formatNumber pattern="#,##0" value="${vo.price}"/></span></p>
            <c:if test="${vo.discount != 0}">
              <p class="content-discount">Discount: <span>${vo.discount}%</span></p>
            </c:if>
     			</div>
      	</div>
	    </c:forEach>
		</div>
	</main>
</body>
</html>