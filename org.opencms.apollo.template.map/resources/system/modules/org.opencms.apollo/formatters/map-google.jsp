<%@page
    buffer="none"
    session="false"
    trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="apollo" tagdir="/WEB-INF/tags/apollo" %>

<apollo:init-messages reload="true">

<cms:formatter var="content" val="value">
<fmt:setLocale value="${cms.locale}" />
<cms:bundle basename="org.opencms.apollo.template.map.messages">

<%-- get width and height of map from content --%>
<c:set var="mapsize">${content.value.MapSize}</c:set>
<c:set var="sizesep">${fn:indexOf(mapsize, "x")}</c:set>
<c:if test="${sizesep != -1}">
    <c:set var="mapw">${fn:trim(fn:substringBefore(mapsize, "x"))}</c:set>
    <c:set var="maph">${fn:trim(fn:substringAfter(mapsize, "x"))}</c:set>
</c:if>
<c:if test="${not fn:contains(mapw, '%')}">
    <c:set var="mapw">${mapw}px</c:set>
</c:if>
<c:if test="${not fn:contains(maph, '%')}">
    <c:set var="maph">${maph}px</c:set>
</c:if>

<div class="ap-map ${cms.element.setting.wrapperclass.isSet ? cms.element.setting.wrapperclass : '' }">

    <c:if test="${not cms.element.settings.hidetitle}">
        <h1 ${value.Headline.rdfaAttr}>${value.Headline}</h1>
    </c:if>

    <c:if test="${value.Text.isSet}">
        <div ${value.Text.rdfaAttr}>${value.Text}</div>
    </c:if>

    <apollo:map 
         id="${cms.element.id}"
         width="${mapw}"
         height="${maph}"
         zoom="${content.value.MapZoom}"
         type="${content.value.MapType}"
         coordinates="${content.valueList.MapCoord[0].value.Coord}"
    />

</div>

</cms:bundle>
</cms:formatter>

</apollo:init-messages>