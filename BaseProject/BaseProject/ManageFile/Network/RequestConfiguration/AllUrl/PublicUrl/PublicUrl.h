//
//  PublicUrl.h
//  PartyMemberPocketBook
//
//  Created by dongchao on 2019/1/2.
//  Copyright © 2019年 dongchao. All rights reserved.
//

#import <Foundation/Foundation.h>


// 上传单个文件（图片）
FOUNDATION_EXPORT NSString *const kServerUploadPath;

// 获取评论信息
FOUNDATION_EXPORT NSString *const kGetCommentPath;

//添加用户操作行为接口 类型:status:10 点赞 thumbs_ups,20 转发 forword,30 收藏 collection,40 浏览 browse
FOUNDATION_EXPORT NSString *const kAddUsrOptPath;

// 文章评论新增接口
FOUNDATION_EXPORT NSString *const kUpdateCommentPath;

// 文章评论删除接口
FOUNDATION_EXPORT NSString *const kDelCommentPath;

// 热门搜索及历史搜索列表
FOUNDATION_EXPORT NSString *const kSearchhotwordsPath;

// 内容检索接口
FOUNDATION_EXPORT NSString *const kFindTitleNameByPagePath;

// 获取文章列表接口
FOUNDATION_EXPORT NSString *const kGetDocListByPagePath;

// 获取栏目图片
FOUNDATION_EXPORT NSString *const kGetcolumnImageByCodePath;

// 获取文章详情
FOUNDATION_EXPORT NSString *const kGetDocDetailPath;

// 版本更新接口
FOUNDATION_EXPORT NSString *const kGetAppVersionPath;

// 保存学习时长
FOUNDATION_EXPORT NSString *const kSaveUserLearningDurationPath;

//2.0
// 保存在线活跃度
FOUNDATION_EXPORT NSString *const kSaveFindorganizationPath;

//2.0记录用户每次登陆
FOUNDATION_EXPORT NSString *const kRecordLogin;

// 根据id查询某些视频及音频的最近学习记录
FOUNDATION_EXPORT NSString *const kFindCMSPlayInfoListPath;

// 根据cmsid及视频系列id集合查询播放记录（视频及系列专用）
FOUNDATION_EXPORT NSString *const kFindCMSPlayMediaInfoListPath;

// 获取banner图列表（根据栏目）
FOUNDATION_EXPORT NSString *const kGetBannerListByColumnIdPath;

// 获取指定栏目详情
FOUNDATION_EXPORT NSString *const kGetColumnInfoByCodePath;

