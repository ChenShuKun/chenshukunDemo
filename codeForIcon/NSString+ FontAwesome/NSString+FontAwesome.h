//
//  NSString+FontAwesome.h
//
//  Copyright (c) 2012 Alex Usbergo. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//

#import <Foundation/Foundation.h>

static NSString *const kFontAwesomeFamilyName = @"FontAwesome";

typedef NS_ENUM(NSInteger, FAIcon) {
    FAIconGlass = 0,    //
    FAIconMusic,        //音符
    FAIconSearch,
    FAIconEnvelope,
    FAIconHeart,
    FAIconStar,
    FAIconStarEmpty,
    FAIconUser,
    FAIconFilm,
    FAIconThLarge,
    FAIconTh,
    FAIconThList,
    FAIconOk,
    FAIconRemove,
    FAIconZoomIn,
    FAIconZoomOut,
    FAIconOff,
    FAIconSignal,
    FAIconCog,
    FAIconTrash,
    FAIconHome,
    FAIconFile,
    FAIconTime,
    FAIconRoad,
    FAIconDownloadAlt,
    FAIconDownload,
    FAIconUpload,
    FAIconInbox,
    FAIconPlayCircle,
    FAIconRepeat,
    FAIconRefresh,
    FAIconListAlt,
    FAIconLock,
    FAIconFlag,
    FAIconHeadphones,
    FAIconVolumeOff,
    FAIconVolumeDown,
    FAIconVolumeUp,
    FAIconQrcode,
    FAIconBarcode,
    FAIconTag,
    FAIconTags,
    FAIconBook,
    FAIconBookmark,
    FAIconPrint,
    FAIconCamera,
    FAIconFont,
    FAIconBold,
    FAIconItalic,
    FAIconTextHeight,
    FAIconTextWidth,
    FAIconAlignLeft,
    FAIconAlignCenter,
    FAIconAlignRight,
    FAIconAlignJustify,
    FAIconList,
    FAIconIndentLeft,
    FAIconIndentRight,
    FAIconFacetimeVideo,
    FAIconPicture,
    FAIconPencil,
    FAIconMapMarker,
    FAIconAdjust,
    FAIconTint,
    FAIconEdit,
    FAIconShare,
    FAIconCheck,
    FAIconMove,
    FAIconStepBackward,
    FAIconFastBackward,
    FAIconBackward,
    FAIconPlay,
    FAIconPause,
    FAIconStop,
    FAIconForward,
    FAIconFastForward,
    FAIconStepForward,
    FAIconEject,
    FAIconChevronLeft,
    FAIconChevronRight,
    FAIconPlusSign,
    FAIconMinusSign,
    FAIconRemoveSign,
    FAIconOkSign,
    FAIconQuestionSign,
    FAIconInfoSign,
    FAIconScreenshot,
    FAIconRemoveCircle,
    FAIconOkCircle,
    FAIconBanCircle,
    FAIconArrowLeft,
    FAIconArrowRight,
    FAIconArrowUp,
    FAIconArrowDown,
    FAIconShareAlt,
    FAIconResizeFull,
    FAIconResizeSmall,
    FAIconPlus,
    FAIconMinus,
    FAIconAsterisk,
    FAIconExclamationSign,
    FAIconGift,
    FAIconLeaf,
    FAIconFire,
    FAIconEyeOpen,
    FAIconEyeClose,
    FAIconWarningSign,
    FAIconPlane,
    FAIconCalendar,
    FAIconRandom,
    FAIconComment,
    FAIconMagnet,
    FAIconChevronUp,
    FAIconChevronDown,
    FAIconRetweet,
    FAIconShoppingCart,
    FAIconFolderClose,
    FAIconFolderOpen,
    FAIconResizeVertical,
    FAIconResizeHorizontal,
    FAIconBarChart,
    FAIconTwitterSign,
    FAIconFacebookSign,
    FAIconCameraRetro,
    FAIconKey,
    FAIconCogs,
    FAIconComments,
    FAIconThumbsUp,
    FAIconThumbsDown,
    FAIconStarHalf,
    FAIconHeartEmpty,
    FAIconSignout,
    FAIconLinkedinSign,
    FAIconPushpin,
    FAIconExternalLink,
    FAIconSignin,
    FAIconTrophy,
    FAIconGithubSign,
    FAIconUploadAlt,
    FAIconLemon,
    FAIconPhone,
    FAIconCheckEmpty,
    FAIconBookmarkEmpty,
    FAIconPhoneSign,
    FAIconTwitter,
    FAIconFacebook,
    FAIconGithub,
    FAIconUnlock,
    FAIconCreditCard,
    FAIconRss,
    FAIconHdd,
    FAIconBullhorn,
    FAIconBell,
    FAIconCertificate,
    FAIconHandRight,
    FAIconHandLeft,
    FAIconHandUp,
    FAIconHandDown,
    FAIconCircleArrowLeft,
    FAIconCircleArrowRight,
    FAIconCircleArrowUp,
    FAIconCircleArrowDown,
    FAIconGlobe,
    FAIconWrench,
    FAIconTasks,
    FAIconFilter,
    FAIconBriefcase,
    FAIconFullscreen,
    FAIconGroup,
    FAIconLink,
    FAIconCloud,
    FAIconBeaker,
    FAIconCut,
    FAIconCopy,
    FAIconPaperClip,
    FAIconSave,
    FAIconSignBlank,
    FAIconReorder,
    FAIconListUl,
    FAIconListOl,
    FAIconStrikethrough,
    FAIconUnderline,
    FAIconTable,
    FAIconMagic,
    FAIconTruck,
    FAIconPinterest,
    FAIconPinterestSign,
    FAIconGooglePlusSign,
    FAIconGooglePlus,
    FAIconMoney,
    FAIconCaretDown,
    FAIconCaretUp,
    FAIconCaretLeft,
    FAIconCaretRight,
    FAIconColumns,
    FAIconSort,
    FAIconSortDown,
    FAIconSortUp,
    FAIconEnvelopeAlt,
    FAIconLinkedin,
    FAIconUndo,
    FAIconLegal,
    FAIconDashboard,
    FAIconCommentAlt,
    FAIconCommentsAlt,
    FAIconBolt,
    FAIconSitemap,
    FAIconUmbrella,
    FAIconPaste,
    FAIconUserMd
};

@interface NSString (FontAwesome)

/* Returns the correct enum for a font-awesome icon.
 * The list of identifiers can be found here:
 * http://fortawesome.github.com/Font-Awesome/#all-icons */
+ (FAIcon)fontAwesomeEnumForIconIdentifier:(NSString*)string;

/* Returns the font-awesome character associated to the
 * icon enum passed as argument */
+ (NSString*)fontAwesomeIconStringForEnum:(FAIcon)value;

/* Returns the font-awesome character associated to the font-awesome
 * identifier.
 * http://fortawesome.github.com/Font-Awesome/#all-icons */
+ (NSString*)fontAwesomeIconStringForIconIdentifier:(NSString*)identifier;


@end