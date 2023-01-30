//
//  TTActionSheet.m
//  TTKit
//
//  Created by tao6 on 2017/9/13.
//  Copyright © 2017年 tao6. All rights reserved.
//

#import "TTActionSheet.h"
#import "UIImage+TTColor.h"

#define     TITLE_FONT_SIZE             13.0f
#define     BUTTON_FONT_SIZE            14.0f
#define     ITEM_FONT_SIZE              16.0f
#define     HEIGHT_BUTTON               61.0f
#define     HEIGHT_CANCEL               (61.0f + SAFEAREA_INSETS_BOTTOM)
#define     SPACE_MIDDEL                1.0f
#define     SPACE_TITLE_LEFT            22.0f
#define     SPACE_TITLE_TOP             20.0f
#define     MAX_HEIGHT_TABLE            [UIScreen mainScreen].bounds.size.height * 0.3

#define     COLOR_BACKGROUND            [UIColor colorWithWhite:0.0 alpha:0.4]
#define     COLOR_DESTRUCTIVE_TITLE     [UIColor redColor]
#define     COLOR_TABLEVIEW_BG          [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0]
#define     COLOR_SEPERATOR             [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]

@interface TTActionSheet() <UITableViewDataSource, UITableViewDelegate>
{
    NSInteger tableViewButtonCount;
}

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *cancelButtonTitle;

@property (nonatomic, strong) NSString *destructiveButtonTitle;

@property (nonatomic, strong) NSMutableArray *otherButtonTitles;

@property (nonatomic, strong) UIButton *backgroudView;

@property (nonatomic, strong) UIView *actionSheetView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) UILabel *headerTitleLabel;

@end

@implementation TTActionSheet

- (instancetype)initWithTitle:(NSString *)title delegate:(id<TTActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    if (self = [super init]) {
        [self setDelegate:delegate];
        [self setTitle:title];
        [self setCancelButtonTitle:cancelButtonTitle];
        [self setDestructiveButtonTitle:destructiveButtonTitle];
        
        va_list list;
        if (otherButtonTitles) {
            self.otherButtonTitles = [[NSMutableArray alloc] initWithCapacity:0];
            [self.otherButtonTitles addObject:otherButtonTitles];
            
            va_start(list, otherButtonTitles);
            NSString *otherTitle = va_arg(list, id);
            while (otherTitle) {
                [self.otherButtonTitles addObject:otherTitle];
                otherTitle = va_arg(list, id);
            }
        }
        
        tableViewButtonCount = self.otherButtonTitles.count + (destructiveButtonTitle ? 1 : 0);
        _numberOfButtons = tableViewButtonCount + (cancelButtonTitle ? 1 : 0);
        _destructiveButtonIndex = (destructiveButtonTitle ? 0 : -1);
        _cancelButtonIndex = (self.cancelButtonTitle ? self.otherButtonTitles.count + (self.destructiveButtonTitle ? 1 : 0) : -1);
        
        [self p_initSubViews];
    }
    return self;
}


- (id)initWithTitle:(NSString *)title clickAction:(void (^)(NSInteger buttonIndex))clickAction cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    if (self = [super init]) {
        [self setTitle:title];
        [self setClickAction:clickAction];
        [self setCancelButtonTitle:cancelButtonTitle];
        [self setDestructiveButtonTitle:destructiveButtonTitle];
        
        va_list list;
        if (otherButtonTitles) {
            self.otherButtonTitles = [[NSMutableArray alloc] initWithCapacity:0];
            [self.otherButtonTitles addObject:otherButtonTitles];
            
            va_start(list, otherButtonTitles);
            NSString *otherTitle = va_arg(list, id);
            while (otherTitle) {
                [self.otherButtonTitles addObject:otherTitle];
                otherTitle = va_arg(list, id);
            }
        }
        
        tableViewButtonCount = self.otherButtonTitles.count + (destructiveButtonTitle ? 1 : 0);
        _numberOfButtons = tableViewButtonCount + (cancelButtonTitle ? 1 : 0);
        _destructiveButtonIndex = (destructiveButtonTitle ? 0 : -1);
        _cancelButtonIndex = (self.cancelButtonTitle ? self.otherButtonTitles.count + (self.destructiveButtonTitle ? 1 : 0) : -1);
        
        [self p_initSubViews];
    }
    return self;
}


- (id)initWithTitle:(NSString *)title
        clickAction:(void (^)(NSInteger buttonIndex))clickAction
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles {

    if (self = [super init]) {
        [self setTitle:title];
        [self setClickAction:clickAction];
        [self setCancelButtonTitle:cancelButtonTitle];
        
        self.otherButtonTitles = otherButtonTitles.mutableCopy;
        
        tableViewButtonCount = self.otherButtonTitles.count;
        _numberOfButtons = tableViewButtonCount + (cancelButtonTitle ? 1 : 0);
        _destructiveButtonIndex = -1;
        _cancelButtonIndex = (self.cancelButtonTitle ? self.otherButtonTitles.count + (self.destructiveButtonTitle ? 1 : 0) : -1);
        
        [self p_initSubViews];
    }
    return self;
    
}


#pragma mark - # Public Methods
- (void)show
{
    [self showInView:[UIApplication sharedApplication].delegate.window];
}

- (void)showInView:(UIView *)view{
    
    if (view == nil) {
        view = [UIApplication sharedApplication].delegate.window;
    }
    
    for (id subView in view.subviews) {
        if ([subView isKindOfClass:[TTActionSheet class]]) {
            return;
        }
    }
    
    [view addSubview:self];
    
    CGRect rect = CGRectMake(0, self.frame.size.height - self.actionSheetView.frame.size.height, self.frame.size.width, self.actionSheetView.frame.size.height);
    [self.backgroudView setBackgroundColor:[UIColor clearColor]];
    [self.actionSheetView setFrame:CGRectMake(0,
                                              self.frame.size.height,
                                              self.actionSheetView.frame.size.width,
                                              self.actionSheetView.frame.size.height)];
    [UIView animateWithDuration:0.2 animations:^{
        [self.actionSheetView setFrame:rect];
        [self.backgroudView setBackgroundColor:COLOR_BACKGROUND];
    }];
}

- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex
{
    buttonIndex -= self.destructiveButtonTitle ? 1 : 0;
    if (buttonIndex == -1) {
        return self.destructiveButtonTitle;
    }
    else if (buttonIndex >= 0 &&  buttonIndex < self.otherButtonTitles.count) {
        return self.otherButtonTitles[buttonIndex];
    }
    else if (buttonIndex == self.otherButtonTitles.count) {
        return self.cancelButtonTitle;
    }
    return nil;
}

#pragma mark - # Event Response
- (void)didTapBackground:(id)sender
{
    if (self.clickAction) {
        self.clickAction(self.cancelButtonIndex);
        self.clickAction = nil;
    }
    if (self.cancelButtonTitle && self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:self.cancelButtonIndex];
    }
    [self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:YES];
}

- (void)cancelButtonClicked:(id)sender
{
    if (self.clickAction) {
        self.clickAction(self.cancelButtonIndex);
        self.clickAction = nil;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:self.cancelButtonIndex];
    }
    [self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:YES];
}

#pragma mark - # Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableViewButtonCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TTActionSheetCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TTActionSheetCell"];
        [cell.textLabel setFont:[UIFont systemFontOfSize:ITEM_FONT_SIZE]];
        [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    }
    
    if (self.destructiveButtonTitle) {
        if (indexPath.row == 0) {
            [cell.textLabel setTextColor:COLOR_DESTRUCTIVE_TITLE];
            [cell.textLabel setText:self.destructiveButtonTitle];
        }
        else {
            [cell.textLabel setTextColor:[UIColor blackColor]];
            [cell.textLabel setText:self.otherButtonTitles[indexPath.row - 1]];
        }
    }
    else {
        [cell.textLabel setTextColor:[UIColor blackColor]];
        [cell.textLabel setText:self.otherButtonTitles[indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickAction) {
        self.clickAction(indexPath.row);
        self.clickAction = nil;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:indexPath.row];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self dismissWithClickedButtonIndex:indexPath.row animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIEdgeInsets edgeInset = UIEdgeInsetsZero;
    if ((self.destructiveButtonTitle && indexPath.row >= self.otherButtonTitles.count) || (!self.destructiveButtonTitle && indexPath.row >= self.otherButtonTitles.count - 1)) {
        edgeInset = UIEdgeInsetsMake(0, 0, 0, self.frame.size.width);
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:edgeInset];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - # Private Methods
- (void)p_initSubViews
{
    [self setFrame:[UIScreen mainScreen].bounds];
    [self addSubview:self.backgroudView];
    [self addSubview:self.actionSheetView];
    [self.tableView setFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
    [self.actionSheetView addSubview:self.tableView];
    [self.backgroudView setFrame:self.bounds];
    
    NSInteger bottomHeight = 0;
    NSInteger tableHeight = 0;
    if (self.cancelButtonTitle) {
        [self.cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
        [self.cancelButton setFrame:CGRectMake(26, self.frame.size.height - HEIGHT_CANCEL + 10, self.frame.size.width - 52, HEIGHT_BUTTON - 20)];
        [self.actionSheetView addSubview:self.cancelButton];
        
        bottomHeight += HEIGHT_CANCEL;
        tableHeight += SPACE_MIDDEL;
    }
    else {
        [self.cancelButton removeFromSuperview];
    }
    
    {
        if (tableViewButtonCount * HEIGHT_BUTTON > self.frame.size.height - bottomHeight - 20) {
            tableHeight += (self.frame.size.height - bottomHeight - 20);
            [self.tableView setBounces:YES];
        }
        else {
            tableHeight += (tableViewButtonCount * HEIGHT_BUTTON);
            [self.tableView setBounces:NO];
        }
        
        if (self.title.length > 0) {
            [self.headerTitleLabel setFrame:CGRectMake(SPACE_TITLE_LEFT, SPACE_TITLE_TOP, self.frame.size.width - SPACE_TITLE_LEFT * 2, 0)];
            [self.headerTitleLabel setText:self.title];
            CGFloat hightTitle = [self.headerTitleLabel sizeThatFits:CGSizeMake(self.headerTitleLabel.frame.size.width, MAXFLOAT)].height;
            [self.headerTitleLabel setFrame:CGRectMake(self.headerTitleLabel.frame.origin.x,
                                                       self.headerTitleLabel.frame.origin.y,
                                                       self.headerTitleLabel.frame.size.width,
                                                       hightTitle)];
            
            CGFloat hightHeader = hightTitle + SPACE_TITLE_TOP * 2;
            UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, hightHeader)];
            [headerView setBackgroundColor:[UIColor whiteColor]];
            [headerView addSubview:self.headerTitleLabel];
            
            if (self.destructiveButtonTitle || tableViewButtonCount > 0) {
                UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, hightHeader - 0.5, self.frame.size.width, 0.5)];
                [lineView setBackgroundColor:COLOR_SEPERATOR];
                [headerView addSubview:lineView];
            }

            [self.tableView setTableHeaderView:headerView];
            tableHeight += hightHeader;
        }
    }
    
    if (tableHeight > MAX_HEIGHT_TABLE) {
        tableHeight = MAX_HEIGHT_TABLE;
    }
    
    [self.actionSheetView setFrame:CGRectMake(0, self.frame.size.height - bottomHeight - tableHeight, self.frame.size.width, bottomHeight + tableHeight)];
    [self.tableView setFrame:CGRectMake(0, 0, self.frame.size.width, tableHeight)];
    [self.cancelButton setFrame:CGRectMake(26, tableHeight + 10, self.frame.size.width - 52, HEIGHT_BUTTON - 20)];
//    [self.cancelButton setFrame:CGRectMake(0, tableHeight, self.frame.size.width, HEIGHT_BUTTON)];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
    if (animated) {
        CGRect rect = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.actionSheetView.frame.size.height);
        [UIView animateWithDuration:0.2 animations:^{
            [self.actionSheetView setFrame:rect];
            [self.backgroudView setBackgroundColor:[UIColor clearColor]];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    else {
        [self removeFromSuperview];
    }
}

#pragma mark - # Getter 
- (UIButton *)backgroudView
{
    if (_backgroudView == nil) {
        _backgroudView = [[UIButton alloc] init];
        [_backgroudView setBackgroundColor:[UIColor blueColor]];
        [_backgroudView addTarget:self action:@selector(didTapBackground:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroudView;
}

- (UIView *)actionSheetView
{
    if (_actionSheetView == nil) {
        _actionSheetView = [[UIView alloc] init];
        [_actionSheetView setBackgroundColor:[UIColor whiteColor]];
    }
    return _actionSheetView;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [_tableView setRowHeight:HEIGHT_BUTTON];
        [_tableView setBackgroundColor:COLOR_TABLEVIEW_BG];
        [_tableView setSeparatorColor:COLOR_SEPERATOR];
        [_tableView setTableFooterView:[UIView new]];
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _tableView;
}

- (UIButton *)cancelButton
{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setBackgroundColor:kThemeColor];
        [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[UIFont systemFontOfSize:BUTTON_FONT_SIZE]];
        [_cancelButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton setBackgroundImage:[UIImage imageWithColor:COLOR_SEPERATOR] forState:UIControlStateHighlighted];
        _cancelButton.layer.cornerRadius = 4;
    }
    return _cancelButton;
}

- (UILabel *)headerTitleLabel
{
    if (_headerTitleLabel == nil) {
        _headerTitleLabel = [[UILabel alloc] init];
        [_headerTitleLabel setTextColor:[UIColor grayColor]];
        [_headerTitleLabel setFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE]];
        [_headerTitleLabel setNumberOfLines:0];
        [_headerTitleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _headerTitleLabel;
}

@end
