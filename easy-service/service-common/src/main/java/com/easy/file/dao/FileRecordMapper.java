package com.easy.file.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.file.bean.FileRecord;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文件记录
 * </p>
 *
 * @author hk
 */
@Mapper
public interface FileRecordMapper extends BaseMapper<FileRecord> {

}