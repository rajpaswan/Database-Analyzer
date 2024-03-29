##  ********************************************
##  Coppermine Photo Gallery
##  ************************
##  Copyright (c) 2003-2006 Coppermine Dev Team
##  v1.1 originally written by Gregory DEMAR
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; either version 2 of the License, or
##  (at your option) any later version.
##  ********************************************
##  Coppermine version: cpgNG
##  $Source$
##  $Revision$
##  $Author: gaugau $
##  $Date: 2006-06-16 12:18:03 +0530 (Fri, 16 Jun 2006) $
##  ********************************************

############# Introduced for CPG NG ##################

#
# Table structure for table CPG_categorymap
#

CREATE TABLE IF NOT EXISTS CPG_categorymap (
    cid int(11) NOT NULL DEFAULT '0' COMMENT '',
    group_id int(11) NOT NULL DEFAULT '0' COMMENT '',
    PRIMARY KEY (cid, group_id)
) TYPE=MyISAM COMMENT='To store the mapping for admin allowable category and their';

#
# Table structure for table CPG_cms
#

CREATE TABLE IF NOT EXISTS CPG_cms (
    ID int(11) NOT NULL COMMENT '' auto_increment,
    conid int(11) NOT NULL DEFAULT '0' COMMENT '',
    title varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    content text NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    cpos int(11) NOT NULL DEFAULT '0' COMMENT '',
    type int(11) NOT NULL DEFAULT '0' COMMENT '',
    PRIMARY KEY (ID, conid),
    FULLTEXT INDEX title (title, content)
) TYPE=MyISAM;

#
# Table structure for table CPG_invitations
#

CREATE TABLE IF NOT EXISTS CPG_invitations (
    id int(11) NOT NULL COMMENT '' auto_increment,
    email varchar(100) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    invitationCode varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    invitationDate datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
    user_id int(11) NOT NULL DEFAULT '0' COMMENT '',
    PRIMARY KEY (id)
) TYPE=MyISAM;

#
# Table structure for table CPG_useralbums
#

CREATE TABLE IF NOT EXISTS CPG_useralbums (
    cid int(11) NOT NULL DEFAULT '0' COMMENT '',
    aid int(11) NOT NULL DEFAULT '0' COMMENT '',
    PRIMARY KEY (cid, aid)
) TYPE=MyISAM COMMENT='Table to store mapping of user albums in public categories';

################### END CPG NG ###################
#
# Table structure for table `CPG_sessions`
#

CREATE TABLE IF NOT EXISTS CPG_sessions (
  session_id varchar(40) NOT NULL default '',
  user_id int(11) default '0',
  time int(11) default NULL,
  remember int(1) default '0',
  PRIMARY KEY (session_id)
) TYPE=MyISAM COMMENT='Used to store sessions';



#
# Table structure for table `CPG_filetypes`
#

CREATE TABLE IF NOT EXISTS CPG_filetypes (
  extension char(7) NOT NULL default '',
  mime char(30) default NULL,
  content char(15) default NULL,
  KEY extension (extension)
) TYPE=MyISAM COMMENT='Used to store the file extensions';

ALTER TABLE `CPG_filetypes` DROP INDEX `EXTENSION`, ADD PRIMARY KEY ( `extension` );
ALTER TABLE `CPG_filetypes` ADD `player` VARCHAR( 5 ) ;

INSERT INTO CPG_filetypes VALUES ('jpg', 'image/jpg', 'image', '');
INSERT INTO CPG_filetypes VALUES ('jpeg', 'image/jpeg', 'image', '');
INSERT INTO CPG_filetypes VALUES ('jpe', 'image/jpe', 'image', '');
INSERT INTO CPG_filetypes VALUES ('gif', 'image/gif', 'image', '');
INSERT INTO CPG_filetypes VALUES ('png', 'image/png', 'image', '');
INSERT INTO CPG_filetypes VALUES ('psd', 'image/psd', 'image', '');
INSERT INTO CPG_filetypes VALUES ('bmp', 'image/bmp', 'image', '');
INSERT INTO CPG_filetypes VALUES ('jpc', 'image/jpc', 'image', '');
INSERT INTO CPG_filetypes VALUES ('jp2', 'image/jp2', 'image', '');
INSERT INTO CPG_filetypes VALUES ('jpx', 'image/jpx', 'image', '');
INSERT INTO CPG_filetypes VALUES ('jb2', 'image/jb2', 'image', '');
INSERT INTO CPG_filetypes VALUES ('swc', 'image/swc', 'image', '');
INSERT INTO CPG_filetypes VALUES ('iff', 'image/iff', 'image', '');
UPDATE CPG_config SET value='ALL' WHERE name='allowed_img_types';

INSERT INTO CPG_filetypes VALUES ('asf', 'video/x-ms-asf', 'movie', 'WMP');
INSERT INTO CPG_filetypes VALUES ('asx', 'video/x-ms-asx', 'movie', 'WMP');
INSERT INTO CPG_filetypes VALUES ('mpg', 'video/mpeg', 'movie', 'WMP');
INSERT INTO CPG_filetypes VALUES ('mpeg', 'video/mpeg', 'movie', 'WMP');
INSERT INTO CPG_filetypes VALUES ('wmv', 'video/x-ms-wmv', 'movie', 'WMP');
INSERT INTO CPG_filetypes VALUES ('swf', 'application/x-shockwave-flash', 'movie', 'SWF');
INSERT INTO CPG_filetypes VALUES ('avi', 'video/avi', 'movie', 'WMP');
INSERT INTO CPG_filetypes VALUES ('mov', 'video/quicktime', 'movie', 'QT');
INSERT INTO CPG_config VALUES ('allowed_mov_types', 'ALL');

INSERT INTO CPG_filetypes VALUES ('mp3', 'audio/mpeg3', 'audio', 'WMP');
INSERT INTO CPG_filetypes VALUES ('midi', 'audio/midi', 'audio', 'WMP');
INSERT INTO CPG_filetypes VALUES ('mid', 'audio/midi', 'audio', 'WMP');
INSERT INTO CPG_filetypes VALUES ('wma', 'audio/x-ms-wma', 'audio', 'WMP');
INSERT INTO CPG_filetypes VALUES ('wav', 'audio/wav', 'audio', 'WMP');
INSERT INTO CPG_filetypes VALUES ('ogg', 'audio/ogg', 'audio', '');
INSERT INTO CPG_config VALUES ('allowed_snd_types', 'ALL');

INSERT INTO CPG_filetypes VALUES ('ram', 'audio/x-pn-realaudio', 'document', 'RMP');
INSERT INTO CPG_filetypes VALUES ('ra', 'audio/x-realaudio', 'document', 'RMP');
INSERT INTO CPG_filetypes VALUES ('rm', 'audio/x-realmedia', 'document', 'RMP');
INSERT INTO CPG_filetypes VALUES ('tiff', 'image/tiff', 'document', '');
INSERT INTO CPG_filetypes VALUES ('tif', 'image/tif', 'document', '');
INSERT INTO CPG_filetypes VALUES ('doc', 'application/msword', 'document', '');
INSERT INTO CPG_filetypes VALUES ('txt', 'text/plain', 'document', '');
INSERT INTO CPG_filetypes VALUES ('rtf', 'text/richtext', 'document', '');
INSERT INTO CPG_filetypes VALUES ('pdf', 'application/pdf', 'document', '');
INSERT INTO CPG_filetypes VALUES ('xls', 'application/excel', 'document', '');
INSERT INTO CPG_filetypes VALUES ('pps', 'application/powerpoint', 'document', '');
INSERT INTO CPG_filetypes VALUES ('ppt', 'application/powerpoint', 'document', '');
INSERT INTO CPG_filetypes VALUES ('zip', 'application/zip', 'document', '');
INSERT INTO CPG_filetypes VALUES ('rar', 'application/rar', 'document', '');
INSERT INTO CPG_filetypes VALUES ('gz', 'application/gz', 'document', '');
INSERT INTO CPG_filetypes VALUES ('mdb', 'application/msaccess', 'document', '');
INSERT INTO CPG_config VALUES ('allowed_doc_types', 'ALL');


#
# Add default media player for movie/audio files
#
UPDATE CPG_filetypes SET player='WMP' WHERE extension IN ('asf','asx','mpg','mpeg','wmv','avi','mp3','midi','mid','wma','wav');
UPDATE CPG_filetypes SET player='QT' WHERE extension IN ('mov');
UPDATE CPG_filetypes SET player='RMP' WHERE extension IN ('ra','ram','rm');
UPDATE CPG_filetypes SET player='SWF' WHERE extension IN ('swc','swf');


#
# Modify structure for table `CPG_comments`
#

ALTER TABLE CPG_comments add msg_raw_ip tinytext;
ALTER TABLE CPG_comments add msg_hdr_ip tinytext;
ALTER TABLE CPG_pictures add pic_raw_ip tinytext;
ALTER TABLE CPG_pictures add pic_hdr_ip tinytext;

INSERT INTO CPG_config VALUES ('thumb_use', 'any');
INSERT INTO CPG_config VALUES ('show_private', '0');
INSERT INTO CPG_config VALUES ('first_level', '1');
INSERT INTO CPG_config VALUES ('display_film_strip', '1');
INSERT INTO CPG_config VALUES ('display_film_strip_filename', '0');
INSERT INTO CPG_config VALUES ('max_film_strip_items', '5');
INSERT INTO CPG_config VALUES ('read_iptc_data', '0');
INSERT INTO CPG_config VALUES ('display_uploader', '0');
# INSERT INTO CPG_config VALUES ('display_admin_uploader','0');
INSERT INTO CPG_config VALUES ('display_filename','0');

#gtroll wil implement
#INSERT INTO CPG_config VALUES ('picinfo_display_filename', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_album_name', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_file_size', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_dimensions', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_count_displayed', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_URL', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_URL_bookmark', '1');
#INSERT INTO CPG_config VALUES ('picinfo_display_favorites', '1');

INSERT INTO CPG_config VALUES ('reg_notify_admin_email', '0');
INSERT INTO CPG_config VALUES ('disable_comment_flood_protect', '0');
INSERT INTO CPG_config VALUES ('upl_notify_admin_email', '0');

INSERT INTO CPG_config VALUES ('language_list', '0');
INSERT INTO CPG_config VALUES ('language_flags', '0');
INSERT INTO CPG_config VALUES ('theme_list', '0');
INSERT INTO CPG_config VALUES ('language_reset', '1');
INSERT INTO CPG_config VALUES ('theme_reset', '1');
INSERT INTO CPG_config VALUES ('offline', '0');
INSERT INTO CPG_config VALUES ('vanity_block','1');

INSERT INTO CPG_config VALUES ('allow_memberlist', '0');
INSERT INTO CPG_config VALUES ('display_faq', '0');
INSERT INTO CPG_config VALUES ('views_in_thumbview', '1');
INSERT INTO CPG_config VALUES ('show_bbcode_help', '1');
INSERT INTO CPG_config VALUES ('log_ecards', '0');
INSERT INTO CPG_config VALUES ('email_comment_notification', '0');
INSERT INTO CPG_config VALUES ('enable_zipdownload', '1');
INSERT INTO CPG_config VALUES ('debug_notice', '0');
INSERT INTO CPG_config VALUES ('slideshow_interval', '5000');

INSERT INTO CPG_config VALUES ('log_mode', '0');

INSERT INTO CPG_config VALUES ('media_autostart', '1');

INSERT INTO CPG_config VALUES ('enable_encrypted_passwords','0');

# Modify structure for category thumb
ALTER TABLE `CPG_categories` ADD `thumb` INT NOT NULL AFTER `parent` ;

# Modify structure for multi album pictures
ALTER TABLE `CPG_albums` ADD `keyword` VARCHAR( 50 ) NOT NULL ;


#
# Table structure for table `CPG_banned`
#

CREATE TABLE CPG_banned (
        ban_id int(11) NOT NULL auto_increment,
        user_id int(11) DEFAULT NULL,
        ip_addr tinytext DEFAULT NULL,
        expiry datetime DEFAULT NULL,
        PRIMARY KEY  (ban_id)
) TYPE=MyISAM;

#
# Table structure for table `CPG_exif`
#
CREATE TABLE CPG_exif (
  `filename` varchar(255) NOT NULL default '',
  `exifData` text NOT NULL,
  UNIQUE KEY `filename` (`filename`)
) TYPE=MyISAM;

#
# Table structure for table `CPG_ecards`
#

CREATE TABLE CPG_ecards (
  eid int(11) NOT NULL auto_increment,
  sender_name varchar(50) NOT NULL default '',
  sender_email text NOT NULL,
  recipient_name varchar(50) NOT NULL default '',
  recipient_email text NOT NULL,
  link text NOT NULL,
  date tinytext NOT NULL,
  sender_ip tinytext NOT NULL,
  PRIMARY KEY  (eid)
) TYPE=MyISAM COMMENT='Used to log ecards';

#
# Modify structure for table 'CPG_usergroups' - Upload form control - Hyperion
#

ALTER TABLE `CPG_usergroups` ADD `upload_form_config` TINYINT(4) DEFAULT '3' NOT NULL;
ALTER TABLE `CPG_usergroups` ADD `custom_user_upload` TINYINT(4) DEFAULT '0' NOT NULL;
ALTER TABLE `CPG_usergroups` ADD `num_file_upload` TINYINT(4) DEFAULT '5' NOT NULL;
ALTER TABLE `CPG_usergroups` ADD `num_URI_upload` TINYINT(4) DEFAULT '3' NOT NULL;



#
# Table structure for table `CPG_temp_data` - Temporary data for file uploads - Hyperion
#

CREATE TABLE IF NOT EXISTS `CPG_temp_data` (
`unique_ID` CHAR( 8 ) NOT NULL ,
`encoded_string` BLOB NOT NULL ,
`timestamp` INT( 11 ) UNSIGNED NOT NULL ,
PRIMARY KEY ( `unique_ID` )
) TYPE = MYISAM COMMENT = 'Holds temporary file data for multiple file uploads';

#
# Close security hole and re-point default theme in 1.3 - Jack
#

UPDATE `CPG_config` SET value='classic' WHERE (name='theme' AND value='default');
DELETE FROM `CPG_filetypes` WHERE mime='text/html';

UPDATE `CPG_config` SET value='$/\\\\:*?&quot;\'&lt;&gt;|` &amp;' WHERE name='forbiden_fname_char';

#
# Finally remove all user_lang references - Jack
#

ALTER TABLE `CPG_users` CHANGE user_lang user_group_list varchar(255) NOT NULL default '';

#
# Fix usermgr timing out with 1k+ users -Omni
#
ALTER TABLE CPG_pictures DROP INDEX `owner_id`;
ALTER TABLE CPG_pictures DROP INDEX `owner_id_2`;
ALTER TABLE CPG_pictures ADD INDEX owner_id( `owner_id` );


#
# Allows user gallery icons
#
ALTER TABLE CPG_pictures ADD `galleryicon` INT UNSIGNED DEFAULT '0' NOT NULL AFTER `approved`;

#
# Record the last hit IP
#

ALTER TABLE `CPG_pictures` ADD `lasthit_ip` TINYTEXT ;

#
# Table structure for table `CPG_favpics`
#

CREATE TABLE `CPG_favpics` (
`user_id` INT( 11 ) NOT NULL ,
`user_favpics` TEXT NOT NULL ,
PRIMARY KEY ( `user_id` )
) COMMENT = 'Stores the server side favourites';


#
# Table structure for table `CPG_dict`
#

CREATE TABLE CPG_dict (
  keyId bigint(20) NOT NULL auto_increment,
  keyword varchar(60) NOT NULL default '',
  PRIMARY KEY  (keyId)
) TYPE=MyISAM  COMMENT = 'Holds the keyword dictionary';

#
# Add config profile rows
#

ALTER TABLE `CPG_users` CHANGE `user_location`  `user_profile1` VARCHAR(255);
ALTER TABLE `CPG_users` CHANGE `user_interests` `user_profile2` VARCHAR(255);
ALTER TABLE `CPG_users` CHANGE `user_website` `user_profile3` VARCHAR(255);
ALTER TABLE `CPG_users` CHANGE `user_occupation` `user_profile4` VARCHAR(255);

ALTER TABLE `CPG_users` ADD `user_profile5` varchar(255) default '' NOT NULL;
ALTER TABLE `CPG_users` ADD `user_profile6` varchar(255) default '' NOT NULL;

#
# Enlarge password field for MD5/SHA1 hash
#

ALTER TABLE `CPG_users` CHANGE `user_password` `user_password` VARCHAR( 40 ) NOT NULL;



INSERT INTO CPG_config VALUES ('user_profile1_name', 'Location');
INSERT INTO CPG_config VALUES ('user_profile2_name', 'Interests');
INSERT INTO CPG_config VALUES ('user_profile3_name', 'Website');
INSERT INTO CPG_config VALUES ('user_profile4_name', 'Occupation');
INSERT INTO CPG_config VALUES ('user_profile5_name', '');
INSERT INTO CPG_config VALUES ('user_profile6_name', 'Biography');


INSERT INTO CPG_config VALUES ('language_fallback', '0');

INSERT INTO CPG_config VALUES ('time_offset', '0');

ALTER TABLE `CPG_users` CHANGE `user_profile6` `user_profile6` TEXT NOT NULL;

ALTER TABLE `CPG_albums` ADD `alb_password` varchar(32) default '';

INSERT INTO CPG_config VALUES ('ban_private_ip', '0');

INSERT INTO CPG_config VALUES ('smtp_host', '');
INSERT INTO CPG_config VALUES ('smtp_username', '');
INSERT INTO CPG_config VALUES ('smtp_password', '');

INSERT INTO CPG_config VALUES ('enable_plugins', '1');

CREATE TABLE CPG_plugins (
  plugin_id int(10) unsigned NOT NULL auto_increment,
  name varchar(64) NOT NULL default '',
  path varchar(128) NOT NULL default '',
  priority int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (plugin_id),
  UNIQUE KEY name (name),
  UNIQUE KEY path (path)
) TYPE=MyISAM COMMENT='Stores the plugins';

INSERT INTO CPG_config VALUES ('enable_help', '2');

INSERT INTO CPG_config VALUES ('allow_email_change', '0');
INSERT INTO CPG_config VALUES ('show_which_exif', '|0|0|0|0|0|0|0|0|1|0|1|1|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|1|0|0|0|1|1|0|0|0|0|1|0|0|0|1|0|0|1|1|0|0|0|0|0|1|0|1|1');
INSERT INTO CPG_config VALUES ('alb_desc_thumb', '1');

ALTER TABLE `CPG_albums` ADD `alb_password_hint` TEXT ;

INSERT INTO CPG_config VALUES ('categories_alpha_sort', '0');
ALTER TABLE `CPG_banned` ADD `brute_force` TINYINT( 5 ) DEFAULT '0' NOT NULL ;
INSERT INTO CPG_config VALUES ('login_threshold', '5');
INSERT INTO CPG_config VALUES ('login_expiry', '10');
INSERT INTO CPG_config VALUES ('clickable_keyword_search', '1');
INSERT INTO CPG_config VALUES ('link_pic_count', '0');
ALTER TABLE CPG_pictures ADD position INT(11) DEFAULT '0' NOT NULL;

INSERT INTO CPG_config VALUES ('auto_resize', '0');

#
# Table structure for table `CPG_bridge`
#

CREATE TABLE CPG_bridge (
  name varchar(40) NOT NULL default '0',
  value varchar(255) NOT NULL default '',
  UNIQUE KEY name (name)
) TYPE=MyISAM;

#
# Data for table `CPG_bridge`
# Used for bridging by user interface
#

INSERT INTO CPG_bridge VALUES ('short_name', '');
INSERT INTO CPG_bridge VALUES ('license_number', '');
INSERT INTO CPG_bridge VALUES ('db_database_name', '');
INSERT INTO CPG_bridge VALUES ('db_hostname', '');
INSERT INTO CPG_bridge VALUES ('db_username', '');
INSERT INTO CPG_bridge VALUES ('db_password', '');
INSERT INTO CPG_bridge VALUES ('full_forum_url', '');
INSERT INTO CPG_bridge VALUES ('relative_path_of_forum_from_webroot', '');
INSERT INTO CPG_bridge VALUES ('relative_path_to_config_file', '');
INSERT INTO CPG_bridge VALUES ('logout_flag', '');
INSERT INTO CPG_bridge VALUES ('use_post_based_groups', '');
INSERT INTO CPG_bridge VALUES ('cookie_prefix', '');
INSERT INTO CPG_bridge VALUES ('table_prefix', '');
INSERT INTO CPG_bridge VALUES ('user_table', '');
INSERT INTO CPG_bridge VALUES ('session_table', '');
INSERT INTO CPG_bridge VALUES ('group_table', '');
INSERT INTO CPG_bridge VALUES ('group_relation_table', '');
INSERT INTO CPG_bridge VALUES ('group_mapping_table', '');
INSERT INTO CPG_bridge VALUES ('use_standard_groups', '1');
INSERT INTO CPG_bridge VALUES ('validating_group', '');
INSERT INTO CPG_bridge VALUES ('guest_group', '');
INSERT INTO CPG_bridge VALUES ('member_group', '');
INSERT INTO CPG_bridge VALUES ('admin_group', '');
INSERT INTO CPG_bridge VALUES ('banned_group', '');
INSERT INTO CPG_bridge VALUES ('global_moderators_group', '');
INSERT INTO CPG_bridge VALUES ('recovery_logon_failures', '0');
INSERT INTO CPG_bridge VALUES ('recovery_logon_timestamp', '');


INSERT INTO CPG_config VALUES ('bridge_enable', '0');

#
# Table structure for table 'CPG_vote_stats'
#
CREATE TABLE CPG_vote_stats (
  `sid` int(11) NOT NULL auto_increment,
  `pid` varchar(100) NOT NULL default '',
  `rating` smallint(6) NOT NULL default '0',
  `ip` varchar(20) NOT NULL default '',
  `sdate` bigint(20) NOT NULL default '0',
  `referer` text NOT NULL,
  `browser` varchar(255) NOT NULL default '',
  `os` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`sid`)
);

INSERT INTO CPG_config VALUES ('vote_details', '0');

CREATE TABLE CPG_hit_stats (
  `sid` int(11) NOT NULL auto_increment,
  `pid` varchar(100) NOT NULL default '',
  `ip` varchar(20) NOT NULL default '',
  `search_phrase` varchar(255) NOT NULL default '',
  `sdate` bigint(20) NOT NULL default '0',
  `referer` text NOT NULL,
  `browser` varchar(255) NOT NULL default '',
  `os` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`sid`)
);

INSERT INTO CPG_config VALUES ('hit_details', '0');

INSERT INTO CPG_config VALUES ('browse_batch_add', '1');

INSERT INTO CPG_config VALUES ('custom_header_path', '');
INSERT INTO CPG_config VALUES ('custom_footer_path', '');

INSERT INTO CPG_config VALUES ('comments_sort_descending', '0');

INSERT INTO CPG_config VALUES ('report_post', '0');

INSERT INTO CPG_config VALUES ('users_can_edit_pics', '0');

INSERT INTO CPG_config VALUES ('allow_unlogged_access', '1');

INSERT INTO CPG_config VALUES ('home_target', 'index.php');

DELETE FROM CPG_config WHERE `name` = 'comment_email_notification';
DELETE FROM CPG_config WHERE `name` = 'hide_admin_uploader';


INSERT INTO CPG_config VALUES ('custom_lnk_name', '');
INSERT INTO CPG_config VALUES ('custom_lnk_url', '');
INSERT INTO CPG_config VALUES ('comments_anon_pfx', 'Guest_');

DELETE FROM CPG_config WHERE `name` = 'admin_activate';
INSERT INTO CPG_config VALUES ('admin_activation', '0');
ALTER TABLE CPG_pictures CHANGE `mtime` `mtime` DATETIME;

DELETE FROM CPG_exif;

#
# Remove support for random keying that has been abandoned.
#
DELETE FROM CPG_config WHERE `name` = 'randpos_interval';
ALTER TABLE CPG_pictures DROP INDEX `randpos`;
ALTER TABLE CPG_pictures DROP `randpos`;

# MySQL 5 compat fixes
ALTER TABLE `CPG_pictures` CHANGE `mtime` `mtime` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00';
ALTER TABLE `CPG_albums` CHANGE `description` `description` TEXT NOT NULL default '';

#################### START CPG NG ###################
ALTER TABLE CPG_albums
    ADD pic_count int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER category,
    ADD last_addition datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '' AFTER thumb,
    ADD stat_uptodate enum('YES','NO') NOT NULL DEFAULT 'NO' COMMENT '' COLLATE latin1_swedish_ci AFTER last_addition,
    ADD parent int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER alb_password_hint,
    ADD user_id int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER parent,
    ADD INDEX uid (user_id);


ALTER TABLE CPG_bridge
    DROP INDEX name;


ALTER TABLE CPG_categories
    ADD subcat_count int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER thumb,
    ADD alb_count int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER subcat_count,
    ADD pic_count int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER alb_count,
    ADD stat_uptodate enum('YES','NO') NOT NULL DEFAULT 'NO' COMMENT '' COLLATE latin1_swedish_ci AFTER pic_count;


ALTER TABLE CPG_comments
    ADD msg_parent int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER msg_id,
    ADD deleted enum('0','1') NOT NULL DEFAULT '0' COMMENT '' COLLATE latin1_swedish_ci AFTER author_id,
    ADD INDEX msg_parent (msg_parent);


ALTER TABLE CPG_favpics
    ALTER user_id SET DEFAULT 0;


ALTER TABLE CPG_filetypes
    MODIFY extension varchar(7) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    MODIFY mime varchar(30) NULL DEFAULT NULL COMMENT '' COLLATE latin1_swedish_ci,
    MODIFY content varchar(15) NULL DEFAULT NULL COMMENT '' COLLATE latin1_swedish_ci;
#
#  Fieldformats of
#    CPG_filetypes.extension changed from char(7) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci to varchar(7) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci.
#    CPG_filetypes.mime changed from char(30) NULL DEFAULT NULL COMMENT '' COLLATE latin1_swedish_ci to varchar(30) NULL DEFAULT NULL COMMENT '' COLLATE latin1_swedish_ci.
#    CPG_filetypes.content changed from char(15) NULL DEFAULT NULL COMMENT '' COLLATE latin1_swedish_ci to varchar(15) NULL DEFAULT NULL COMMENT '' COLLATE latin1_swedish_ci.
#  Possibly data modifications needed!
#

ALTER TABLE CPG_pictures
    MODIFY mtime datetime NULL DEFAULT NULL COMMENT '',
    MODIFY galleryicon int(10) unsigned NOT NULL DEFAULT '0' COMMENT '';
#
#  Fieldformats of
#    CPG_pictures.mtime changed from datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '' to datetime NULL DEFAULT NULL COMMENT ''.
#    CPG_pictures.galleryicon changed from int(11) NOT NULL DEFAULT '0' COMMENT '' to int(10) unsigned NOT NULL DEFAULT '0' COMMENT ''.
#  Possibly data modifications needed!
#

ALTER TABLE CPG_plugins
    ADD id int(10) unsigned NOT NULL COMMENT '' auto_increment FIRST,
    ADD namespaces text NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci AFTER path,
    ADD installed enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '' COLLATE latin1_swedish_ci AFTER namespaces,
    ADD active enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '' COLLATE latin1_swedish_ci AFTER installed,
    DROP plugin_id,
    DROP name,
    MODIFY path varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    MODIFY priority int(11) NOT NULL DEFAULT '0' COMMENT '',
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (id),
    DROP INDEX name,
    DROP INDEX path,
    ADD INDEX active (active),
    ADD INDEX installed (installed),
    ADD INDEX priority (priority),
    COMMENT='';
#
#  Fieldformats of
#    CPG_plugins.path changed from varchar(128) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci to varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci.
#    CPG_plugins.priority changed from int(10) unsigned NOT NULL DEFAULT '0' COMMENT '' to int(11) NOT NULL DEFAULT '0' COMMENT ''.
#  Possibly data modifications needed!
#

ALTER TABLE CPG_temp_data
    MODIFY unique_ID varchar(8) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci,
    ALTER `timestamp` SET DEFAULT 0;
#
#  Fieldformat of
#    CPG_temp_data.unique_ID changed from char(8) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci to varchar(8) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci.
#  Possibly data modifications needed!
#

ALTER TABLE CPG_users
    ADD reset_key varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE latin1_swedish_ci AFTER user_actkey;

UPDATE `CPG_config` SET value='bluedot' WHERE name='theme';
INSERT INTO CPG_config VALUES ('display_mini_toolbar', '1');
INSERT INTO CPG_config VALUES ('max_inactive_users_days', '');
INSERT INTO CPG_config VALUES ('short_url', '0');
####################### END CPG NG ###################