//
//  SCConstants.h
//  CartObjectiveC
//
//  Created by Satyadev on 20/10/18.
//  Copyright © 2018 Satyadev Chauhan. All rights reserved.
//

#ifndef SCConstants_h
#define SCConstants_h

#import <Foundation/Foundation.h>
#import "SCError.h"

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

#define SERVER_URL          @"https://demo3325365.mockable.io/category"
#define SERVER_URL_PARAM    @"https://demo3325365.mockable.io/%@"

#define numberOfColumns (IDIOM == IPAD ? 5 : 3)
#define numberOfRows 2

typedef void(^SuccessBlock)(NSArray *items);
typedef void(^ErrorBlock)(SCError * error);

SCError * checkForOKResponse(NSURLResponse *response);

#define polos @[@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/4046711/2018/3/15/11521111154504-Maniac-Men-White-Checked-Round-Neck-T-shirt-8891521111154316-1.jpg",\
@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/6553107/2018/5/28/d23b65ef-2059-44b3-b1b2-3f8aa91bc8161527498508236-HIGHLANDER-Men-Navy-Blue-Striped-Round-Neck-T-shirt-8981527498508067-1.jpg",\
@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/4046705/2018/3/15/11521111132809-Maniac-Men-Navy-Blue-Checked-Round-Neck-T-shirt-2051521111132544-1.jpg",\
@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/4921840/2018/5/3/11525336826081-HERENOW-Men-White-Striped-Round-Neck-T-shirt-8611525336826000-1.jpg",\
@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1010692/2018/2/8/11518065989068-Moda-Rapido-Navy--White-Striped-T-shirt-8561518065988891-1.jpg",\
@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/4447261/2018/4/3/11522743639321-n-6731522743639072-1.jpg",\
@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/6553324/2018/5/28/17be7d2f-a11e-4934-a5ad-f77775b119201527498572114-HIGHLANDER-Men-Black-Solid-Hood-T-shirt-5591527498571870-1.jpg"]

#define shirts @[@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7051132/2018/9/5/63e142a0-891c-42af-b601-f58f0771f6961536147625618-Celio-Men-Pink-Slim-Fit-Solid-Casual-Shirt-4061536147624497-1.jpg", \
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1979348/2017/12/5/11512457137542-HIGHLANDER-Men-White-Slim-Fit-Printed-Casual-Shirt-3001512457137360-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7226816/2018/10/3/e8048dfa-26c0-4e4f-aff6-cbc0cf278e481538550263865-GAP-Mens-Pattern-Oxford-Shirt-in-Stretch-3581538550260020-3.jpg", \
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7222443/2018/8/24/08652ee2-0a28-4f5f-aa42-b8dde3e93d6e1535105644181-Gant-Men-Grey-Regular-Fit-Checked-Casual-Shirt-7761535105643909-1.jpg", \
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1862801/2018/2/9/11518155061506-Roadster-Men-Maroon--Navy-Blue-Regular-Fit-Checked-Casual-Shirt-8861518155061131-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1272502/2018/2/5/11517823086440-Highlander-White-Slim-Fit-Casual-Shirt-161517823086304-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1707224/2017/4/21/11492776602033-Mast--Harbour-Men-Shirts-4611492776601808-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7222428/2018/8/24/0c01bcb7-4339-4e03-a2d7-cc91bc11bfbc1535105602989-GANT-Men-Pink--Blue-Regular-Fit-Striped-Casual-Shirt-8741535105602636-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/2006852/2018/4/3/11522753460014-HIGHLANDER-Men-Blue--White-Slim-Fit-Checked-Casual-Shirt-2811522753459810-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7226819/2018/10/3/96494b80-4c18-49fd-b7c3-2458a5d4618b1538550255163-GAP-Mens-Slim-Oxford-Shirt-in-Stretch-2291538550253228-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7222443/2018/8/24/08652ee2-0a28-4f5f-aa42-b8dde3e93d6e1535105644181-Gant-Men-Grey-Regular-Fit-Checked-Casual-Shirt-7761535105643909-1.jpg"]

#define sweatshirts @[@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/2136200/2017/9/21/11505983333023-Campus-Sutra-Mens-Solid-Hoodie-2941505983332816-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/images/style/properties/Belle-Fille-Navy-Hooded-Sweatshirt_50ce395d8b4d7f1eafc65214383977c9_images.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/2006785/2017/10/12/11507785896553-Roadster-Men-Grey--Navy-Blue-Solid-Hooded-Sweatshirt-5051507785896373-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1862360/2017/11/7/11510058324179-Roadster-Women-Black-Solid-Hooded-Sweatshirt-7041510058323998-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7184964/2018/10/3/2b8680fb-f5a9-47b4-8b52-977f2cf9e7bb1538549127404-Puma-Men-Jackets-7541538549125825-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1855488/2017/8/31/11504179680174-Mast--Harbour-Men-Orange-Solid-Sweatshirt-7431504179680051-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/2111978/2017/9/9/11504952529347-Campus-Sutra-Womens-Sweatshirt-9821504952529146-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1997580/2017/9/13/11505300255658-Roadster-Men-Tshirts-161505300255480-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/6832923/2018/9/3/dd70bf96-2745-4bff-8295-ae7ad5694db11535958985906-WROGN-Men-Navy-Blue-Solid-Hooded-Sweatshirt-3291535958984601-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/7226445/2018/9/18/ae6cb9b5-268e-4182-b95c-cb975257fcc71537260327969-GAP-Mens-Black-Logo-Fleece-Crewneck-Sweatshirt-7721537260326-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/6959604/2018/9/5/dc2d1286-603b-43b4-98ec-b08aa315c2251536142885699-INVICTUS-Men-White--Mustard-Colourblocked-Sweatshirt-2101536-1.jpg"]

#define jackets @[@"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/2033529/2017/8/8/11502170320071-Campus-Sutra-Womens-Jacket-5491502170319884-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/2013381/2017/9/4/11504501499589-Mast--Harbour-Men-Navy-Blue-Solid-Sporty-Jacket-6941504501499316-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/5633477/2018/9/29/772ba24f-152b-4bcc-88c5-77419e1a60ee1538202332989-Mast--Harbour-Women-Rose--Grey-Colourblocked-Bomber-78015382-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1694433/2016/12/22/11482407451048-SASSAFRAS-Women-Jackets-141482407450781-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1845160/2017/8/14/11502696901342-Roadster-Men-Navy-Blue-Solid-Puffer-Jacket-4841502696901125-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1340677/2016/9/16/11474021226693-Roadster-Black-Hooded-Puffer-Jacket-3391474021225879-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/6832168/2018/8/25/9d2a11b8-f5bd-4db7-8699-8753d69cc0ee1535176773002-WROGN-Men-Jackets-7511535176771043-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/1716514/2017/1/10/11484050635146-Purple-Feather-Women-Jackets-7961484050634941-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/6996804/2018/7/23/93e98456-b6e9-4df7-a0b7-68fe83070c4e1532339060342-Campus-Sutra-Full-Sleeve-Solid-Men-Jacket-4121532339060152-1.jpg",\
    @"https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/4453330/2018/8/21/0e5cbce2-3c89-4b1d-b794-904d607837e61534842391812-HRX-by-Hrithik-Roshan-Men-Navy-Blue-Solid-Bomber-37015348423-1.jpg"]

#define Category_URLs @{@"polos": polos, @"shirts": shirts, @"sweatshirts": sweatshirts, @"jackets": jackets}

#endif /* SCConstants_h */
