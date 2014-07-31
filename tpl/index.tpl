<!doctype html><html lang="{$lang}" ng-app="genteeApp" ng-controller="GenteeCtrl" ><head>    <meta charset="utf-8">    <link rel="icon" href="favicon.ico" type="image/x-icon" />     <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />    <title>{{cfg.title}}</title>    {$style}          <link rel="stylesheet" href="{$appdir}js/redactor/redactor.css" />    <script src="{$appdir}js/jquery.min.js" type="text/javascript"></script>  </head>  <body>  <div id="main" ge-main="0"><div id="top">    <span ng-bind="cfg.title"></span>   <div  style="float:right;margin-bottom: 8px;">        <b>{{cfg.user.login}}</b>       <div ng-show="cfg.user" class="btn-group">         <a href="#/settings" class="btn" ><i class="fa fa-cog"></i>{{lng.settings}}</a>         <a href="" class="btn" ng-click="logout()"><i class="fa fa-power-off"></i>{{lng.logout}}</a>       </div>  </div></div><div id="header">    <div id="menu" ng-show="cfg.user">      <a class="amenu" style="border: 0" href="#/" title="{{lng.dashboard}}"><i class="fa fa-home"></i></a>      <div class="menuitem" ng-repeat="imenu in topmenu" onMouseOver='js_menuover( this );' onMouseOut='js_menuout( this );'><a class="amenu" title="{{imenu.hint}}" ng-if="imenu.isfolder==0" ng-href="{{imenu.url}}">{{imenu.title}}</a>        <div class="fmenu" ng-if="imenu.isfolder">{{imenu.title}} <i class="fa fa-caret-down"></i></div>        <div ng-if="imenu.isfolder" class="submenu" >            <div class="submenuitem" ng-repeat="isubmenu in imenu.children"                onMouseOver='js_menuover( this );' onMouseOut='js_menuout( this );'>              <nobr><a class="asubmenu" title="{{isubmenu.hint}}" ng-if="isubmenu.isfolder==0" ng-href="{{isubmenu.url}}">{{isubmenu.title}}</a></nobr>              <nobr><div class="fsubmenu" ng-if="isubmenu.isfolder">{{isubmenu.title}} <i class="fa fa-caret-right"></i></div></nobr>              <div ng-if="isubmenu.isfolder" class="sub2menu" >                <div class="sub2menuitem" ng-repeat="isub2menu in isubmenu.children">                  <nobr><a class="asubmenu" title="{{isub2menu.hint}}" ng-if="isub2menu.isfolder==0" ng-href="{{isub2menu.url}}">{{isub2menu.title}}</a></nobr>                 <nobr><div class="fsubmenu" ng-if="isub2menu.isfolder">{{isub2menu.title}} <i class="fa fa-caret-right"></i></div></nobr>                </div>              </div>            </div>        </div>      </div>      <a class="amenu" style="border: 0" href="" ng-click="newmenu()" title="{{lng.newitem}}"><i class="fa fa-plus-circle"></i></a>    </div>    <div id="info" ng-show="!cfg.user">         <b><a href="http://{{cfg.website}}" target="_blank">{{cfg.website}}</a></b><!--&nbsp;&middot;&nbsp;{{lng.info}}-->    </div></div>  <div id="content" app-view-segment="0"></div></div><!-- #main --><div id="footer" bindonce>    <div ng-hide="cfg.footer"><a href="http://{{cfg.website}}" bo-text="cfg.appname"></a> v<span bo-text="cfg.version"></span> <b>&middot;</b> <span bo-text="lng.owner"></span> <b>&middot;</b> <span bo-text="lng.license"></span> <a target="_blank" href="http://opensource.org/licenses/mit-license.html">MIT License</a></div>    <div ng-show="cfg.footer" bo-html="cfg.footer"></div></div><div ng-show="loading" class="loading">   <img src="{$appdir}images/ajax-loader.gif"><span>{{lng.loading}}...</span></div><div class='notify' style="display:none;" id="nfy_info">    <a href="" class="close" onclick="$(this).parent().hide();"><i class="fa fa-times"></i></a>    <i class="fa fa-2x pull-left fa-border fa-info-circle blue" style="background-color: #fff;"></i>       <span ></span></div><script type="text/ng-template" id="dialog.html">    <a href="" class="close" ng-click="cancel()"><i class="fa fa-times fa-lg"></i></a>    <div class="modal-header">        <h3>{{dlg.title}}</h3>    </div>    <div class="modal-body"  stylex="background-color:#FFD1D1" ng-if="!dlg.template">       <i ng-show="dlg.icon" class="fa {{dlg.icon}} fa-2x pull-left fa-border {{dlg.icon_class}}"></i>       {{dlg.body}}    </div>    <div class="modal-body" ng-include="dlg.template" ng-if="dlg.template">    </div>    <div class="modal-footer">        <!--button class="btn" ng-click="ok()" ng-show="ok">OK</button-->        <button ng-repeat="ibtn in dlg.btns" class="btn {{ibtn.class}}" ng-click="button( ibtn )">{{ibtn.text}}</button>    </div></script><script type="text/javascript">var cfg = {$cfg};//var types = {$types};var langlist = {$langlist};$(document).ready(function() {  if ( angular.isDefined( cfg.htmleditor ))      js_loadjs( "/"+cfg.htmleditor.name+'/'+cfg.htmleditor.name + '.js', function(){} );})</script>    <!--script src="/ckeditor/ckeditor.js" type="text/javascript"></script-->  <script src="{$appdir}js/angular/angular.min.js" type="text/javascript"></script>    <script src="{$appdir}js/angular/i18n/angular-locale_{$lang}.js"></script>    <script id="langjs" src="{$appdir}js/l10n/locale_{$lang}.js"></script>    <script src="{$appdir}js/eonza-lib.js" type="text/javascript"></script>    <script src="{$appdir}js/angular/angular-cookies.min.js" type="text/javascript"></script>    <script src="{$appdir}js/angular/angular-route.min.js" type="text/javascript"></script>    <script src="{$appdir}js/angular/angular-sanitize.min.js" type="text/javascript"></script>    <script src="{$appdir}js/angular/angular-route-segment.min.js" type="text/javascript"></script>    <script src="{$appdir}js/angular/angular-file-upload.js" type="text/javascript"></script>    <script src="{$appdir}js/ui-bootstrap-custom-tpls-0.6.0.min.js" type="text/javascript"></script>    <script src="{$appdir}js/jquery-ui-sortable.min.js" type="text/javascript"></script>    <script src="{$appdir}js/bindonce.js" type="text/javascript"></script>     <script src="{$appdir}js/angular-lib.js" type="text/javascript"></script>    <script src="{$appdir}js/gentee.js" type="text/javascript"></script>    <script src="{$appdir}js/controllers.js" type="text/javascript"></script>    <script src="{$appdir}js/directives.js" type="text/javascript"></script>    <script src="{$appdir}js/redactor/redactor.min.js"></script>    <script src="{$appdir}js/redactor/fullscreen.js"></script>    <script src="{$appdir}js/devtools.js"></script>    <!--script src="/custom/custom.js" type="text/javascript"></script-->    <!--script src="js/filters.js" type="text/javascript"></script--></body></html>