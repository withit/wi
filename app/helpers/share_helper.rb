module ShareHelper
  def share_link
    <<-EOF
    <!-- AddThis Button BEGIN -->
    <script type="text/javascript">var addthis_pub="withimagination";</script>

    <a href="http://www.addthis.com/bookmark.php" onmouseover="return addthis_open(this, '', '[URL]', '[TITLE]')" onmouseout="addthis_close()" onclick="return addthis_sendto()"><img src="http://s7.addthis.com/static/btn/lg-share-en.gif" width="125" height="16" border="0" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/152/addthis_widget.js"></script>
    <!-- AddThis Button END -->
    EOF
  end
end