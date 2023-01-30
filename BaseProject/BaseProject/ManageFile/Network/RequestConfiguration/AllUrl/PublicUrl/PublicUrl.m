//
//  PublicUrl.m
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import "PublicUrl.h"

// 单文件上传（图片及文本文件等小文件）
NSString *const kServerUploadPath = @"/re/server/upload";

// 获取评论信息
//NSString *const kGetCommentPath = @"/cms/api/doc/getComment";
//2.0
// 获取评论信息
NSString *const kGetCommentPath = @"/pkb/api/apiCmsDoc/ComReplByIdDoc";

//添加用户操作行为接口 类型:status:10 点赞 thumbs_ups,20 转发 forword,30 收藏 collection,40 浏览 browse
//NSString *const kAddUsrOptPath = @"/cms/api/doc/addUsrOpt";
//2.0
//添加用户操作行为接口 类型:status:10 点赞 thumbs_ups,20 转发 forword,30 收藏 collection,40 浏览 browse
NSString *const kAddUsrOptPath = @"/pkb/api/apiCmsDoc/addUsrOpt";


// 文章评论新增接口
//NSString *const kUpdateCommentPath = @"/cms/api/doc/updateComment";
//2.0
// 文章评论新增接口
NSString *const kUpdateCommentPath = @"/pkb/api/apiCmsDoc/save";


// 文章评论删除接口
//NSString *const kDelCommentPath = @"/cms/api/doc/delComment";
//2.0
// 文章评论删除接口
NSString *const kDelCommentPath = @"/pkb/api/apiCmsDoc/delReply";


// 热门搜索及历史搜索列表
NSString *const kSearchhotwordsPath = @"/cms/api/searchhotwords/listByPage";

// 内容检索接口
NSString *const kFindTitleNameByPagePath = @"/cms/api/solr/findTitleNameByPage";

// 获取文章列表接口
NSString *const kGetDocListByPagePath = @"/cms/api/doc/getDocListByPage";

// 获取栏目图片
NSString *const kGetcolumnImageByCodePath = @"/pbk/api/columnimages/getcolumnImageByCode";

// 获取文章详情
//NSString *const kGetDocDetailPath = @"/cms/api/doc/getDoc";
//2.0
// 获取文章详情
NSString *const kGetDocDetailPath = @"/pkb/api/apiCmsDoc/detail";

// 版本更新接口
NSString *const kGetAppVersionPath = @"/system/api/appversion/getAppVersion";

// 保存学习时长
NSString *const kSaveUserLearningDurationPath = @"/rbac/api/userlearningduration/saveUserLearningDuration";

//2.0
// 保存在线活跃度
NSString *const kSaveFindorganizationPath = @"/rbac/rbacuseractivelog/save";

//2.0记录用户每次登陆
NSString *const kRecordLogin = @"/rbac/statisticalGraphController/recordLogin";

// 根据id查询某些视频及音频的最近学习记录
NSString *const kFindCMSPlayInfoListPath = @"/rbac/api/userlearningduration/findCMSPlayInfoList";

// 根据cmsid及视频系列id集合查询播放记录（视频及系列专用）
NSString *const kFindCMSPlayMediaInfoListPath = @"/rbac/api/userlearningduration/findCMSPlayMediaInfoList";

// 获取banner图列表（根据栏目）
NSString *const kGetBannerListByColumnIdPath = @"/pbk/api/home/getBannerListByColumnId";

// 获取指定栏目详情
NSString *const kGetColumnInfoByCodePath = @"/rbac/api/resource/getColumnInfoByCode";




