
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 宽带
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/kuandai")
public class KuandaiController {
    private static final Logger logger = LoggerFactory.getLogger(KuandaiController.class);

    private static final String TABLE_NAME = "kuandai";

    @Autowired
    private KuandaiService kuandaiService;


    @Autowired
    private TokenService tokenService;

    @Autowired
    private BaoxiuService baoxiuService;//报修
    @Autowired
    private BaoxiuCommentbackService baoxiuCommentbackService;//报修评价
    @Autowired
    private BaoxiuFenpeiService baoxiuFenpeiService;//报修分配
    @Autowired
    private DictionaryService dictionaryService;//字典
    @Autowired
    private FeiyongService feiyongService;//宽带缴费
    @Autowired
    private ForumService forumService;//论坛
    @Autowired
    private GonggaoService gonggaoService;//公告
    @Autowired
    private KuandaiCollectionService kuandaiCollectionService;//宽带收藏
    @Autowired
    private KuandaiLiuyanService kuandaiLiuyanService;//宽带留言
    @Autowired
    private KuandaiOrderService kuandaiOrderService;//宽带开户
    @Autowired
    private KuandaiYuyueService kuandaiYuyueService;//宽带预约安装
    @Autowired
    private QianyiYuyueService qianyiYuyueService;//迁移申请
    @Autowired
    private YewurenyuanService yewurenyuanService;//业务人员
    @Autowired
    private YonghuService yonghuService;//用户
    @Autowired
    private UsersService usersService;//管理员


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("业务人员".equals(role))
            params.put("yewurenyuanId",request.getSession().getAttribute("userId"));
        params.put("kuandaiDeleteStart",1);params.put("kuandaiDeleteEnd",1);
        CommonUtil.checkMap(params);
        PageUtils page = kuandaiService.queryPage(params);

        //字典表数据转换
        List<KuandaiView> list =(List<KuandaiView>)page.getList();
        for(KuandaiView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        KuandaiEntity kuandai = kuandaiService.selectById(id);
        if(kuandai !=null){
            //entity转view
            KuandaiView view = new KuandaiView();
            BeanUtils.copyProperties( kuandai , view );//把实体数据重构到view中
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody KuandaiEntity kuandai, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,kuandai:{}",this.getClass().getName(),kuandai.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<KuandaiEntity> queryWrapper = new EntityWrapper<KuandaiEntity>()
            .eq("kuandai_name", kuandai.getKuandaiName())
            .eq("kuandai_types", kuandai.getKuandaiTypes())
            .eq("kuandai_delete", kuandai.getKuandaiDelete())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        KuandaiEntity kuandaiEntity = kuandaiService.selectOne(queryWrapper);
        if(kuandaiEntity==null){
            kuandai.setKuandaiDelete(1);
            kuandai.setInsertTime(new Date());
            kuandai.setCreateTime(new Date());
            kuandaiService.insert(kuandai);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody KuandaiEntity kuandai, HttpServletRequest request) throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        logger.debug("update方法:,,Controller:{},,kuandai:{}",this.getClass().getName(),kuandai.toString());
        KuandaiEntity oldKuandaiEntity = kuandaiService.selectById(kuandai.getId());//查询原先数据

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        if("".equals(kuandai.getKuandaiPhoto()) || "null".equals(kuandai.getKuandaiPhoto())){
                kuandai.setKuandaiPhoto(null);
        }

            kuandaiService.updateById(kuandai);//根据id更新
            return R.ok();
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids, HttpServletRequest request){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        List<KuandaiEntity> oldKuandaiList =kuandaiService.selectBatchIds(Arrays.asList(ids));//要删除的数据
        ArrayList<KuandaiEntity> list = new ArrayList<>();
        for(Integer id:ids){
            KuandaiEntity kuandaiEntity = new KuandaiEntity();
            kuandaiEntity.setId(id);
            kuandaiEntity.setKuandaiDelete(2);
            list.add(kuandaiEntity);
        }
        if(list != null && list.size() >0){
            kuandaiService.updateBatchById(list);
        }

        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            List<KuandaiEntity> kuandaiList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("static/upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            KuandaiEntity kuandaiEntity = new KuandaiEntity();
//                            kuandaiEntity.setKuandaiName(data.get(0));                    //宽带名称 要改的
//                            kuandaiEntity.setKuandaiUuidNumber(data.get(0));                    //宽带编号 要改的
//                            kuandaiEntity.setKuandaiPhoto("");//详情和图片
//                            kuandaiEntity.setKuandaiTypes(Integer.valueOf(data.get(0)));   //宽带类型 要改的
//                            kuandaiEntity.setKuandaiContent("");//详情和图片
//                            kuandaiEntity.setKuandaiDelete(1);//逻辑删除字段
//                            kuandaiEntity.setInsertTime(date);//时间
//                            kuandaiEntity.setCreateTime(date);//时间
                            kuandaiList.add(kuandaiEntity);


                            //把要查询是否重复的字段放入map中
                                //宽带编号
                                if(seachFields.containsKey("kuandaiUuidNumber")){
                                    List<String> kuandaiUuidNumber = seachFields.get("kuandaiUuidNumber");
                                    kuandaiUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> kuandaiUuidNumber = new ArrayList<>();
                                    kuandaiUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("kuandaiUuidNumber",kuandaiUuidNumber);
                                }
                        }

                        //查询是否重复
                         //宽带编号
                        List<KuandaiEntity> kuandaiEntities_kuandaiUuidNumber = kuandaiService.selectList(new EntityWrapper<KuandaiEntity>().in("kuandai_uuid_number", seachFields.get("kuandaiUuidNumber")).eq("kuandai_delete", 1));
                        if(kuandaiEntities_kuandaiUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(KuandaiEntity s:kuandaiEntities_kuandaiUuidNumber){
                                repeatFields.add(s.getKuandaiUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [宽带编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        kuandaiService.insertBatch(kuandaiList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }



    /**
    * 个性推荐
    */
    @IgnoreAuth
    @RequestMapping("/gexingtuijian")
    public R gexingtuijian(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("gexingtuijian方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        CommonUtil.checkMap(params);
        List<KuandaiView> returnKuandaiViewList = new ArrayList<>();

        //查询订单
        Map<String, Object> params1 = new HashMap<>(params);params1.put("sort","id");params1.put("yonghuId",request.getSession().getAttribute("userId"));
        PageUtils pageUtils = kuandaiOrderService.queryPage(params1);
        List<KuandaiOrderView> orderViewsList =(List<KuandaiOrderView>)pageUtils.getList();
        Map<Integer,Integer> typeMap=new HashMap<>();//购买的类型list
        for(KuandaiOrderView orderView:orderViewsList){
            Integer kuandaiTypes = orderView.getKuandaiTypes();
            if(typeMap.containsKey(kuandaiTypes)){
                typeMap.put(kuandaiTypes,typeMap.get(kuandaiTypes)+1);
            }else{
                typeMap.put(kuandaiTypes,1);
            }
        }
        List<Integer> typeList = new ArrayList<>();//排序后的有序的类型 按最多到最少
        typeMap.entrySet().stream().sorted((o1, o2) -> o2.getValue() - o1.getValue()).forEach(e -> typeList.add(e.getKey()));//排序
        Integer limit = Integer.valueOf(String.valueOf(params.get("limit")));
        for(Integer type:typeList){
            Map<String, Object> params2 = new HashMap<>(params);params2.put("kuandaiTypes",type);
            PageUtils pageUtils1 = kuandaiService.queryPage(params2);
            List<KuandaiView> kuandaiViewList =(List<KuandaiView>)pageUtils1.getList();
            returnKuandaiViewList.addAll(kuandaiViewList);
            if(returnKuandaiViewList.size()>= limit) break;//返回的推荐数量大于要的数量 跳出循环
        }
        //正常查询出来商品,用于补全推荐缺少的数据
        PageUtils page = kuandaiService.queryPage(params);
        if(returnKuandaiViewList.size()<limit){//返回数量还是小于要求数量
            int toAddNum = limit - returnKuandaiViewList.size();//要添加的数量
            List<KuandaiView> kuandaiViewList =(List<KuandaiView>)page.getList();
            for(KuandaiView kuandaiView:kuandaiViewList){
                Boolean addFlag = true;
                for(KuandaiView returnKuandaiView:returnKuandaiViewList){
                    if(returnKuandaiView.getId().intValue() ==kuandaiView.getId().intValue()) addFlag=false;//返回的数据中已存在此商品
                }
                if(addFlag){
                    toAddNum=toAddNum-1;
                    returnKuandaiViewList.add(kuandaiView);
                    if(toAddNum==0) break;//够数量了
                }
            }
        }else {
            returnKuandaiViewList = returnKuandaiViewList.subList(0, limit);
        }

        for(KuandaiView c:returnKuandaiViewList)
            dictionaryService.dictionaryConvert(c, request);
        page.setList(returnKuandaiViewList);
        return R.ok().put("data", page);
    }

    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        CommonUtil.checkMap(params);
        PageUtils page = kuandaiService.queryPage(params);

        //字典表数据转换
        List<KuandaiView> list =(List<KuandaiView>)page.getList();
        for(KuandaiView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段

        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        KuandaiEntity kuandai = kuandaiService.selectById(id);
            if(kuandai !=null){


                //entity转view
                KuandaiView view = new KuandaiView();
                BeanUtils.copyProperties( kuandai , view );//把实体数据重构到view中

                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody KuandaiEntity kuandai, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,kuandai:{}",this.getClass().getName(),kuandai.toString());
        Wrapper<KuandaiEntity> queryWrapper = new EntityWrapper<KuandaiEntity>()
            .eq("kuandai_name", kuandai.getKuandaiName())
            .eq("kuandai_uuid_number", kuandai.getKuandaiUuidNumber())
            .eq("kuandai_types", kuandai.getKuandaiTypes())
            .eq("kuandai_delete", kuandai.getKuandaiDelete())
//            .notIn("kuandai_types", new Integer[]{102})
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        KuandaiEntity kuandaiEntity = kuandaiService.selectOne(queryWrapper);
        if(kuandaiEntity==null){
            kuandai.setKuandaiDelete(1);
            kuandai.setInsertTime(new Date());
            kuandai.setCreateTime(new Date());
        kuandaiService.insert(kuandai);

            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

}

