package com.acorn.racket.facility.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ParamDTO {
	int limit;
	int offset;
	OptionDTO options;
}
