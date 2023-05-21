﻿/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.         ______
 * Copyright (C) 2020 Mandelbulber Team   _>]|=||i=i<,      / ____/ __    __
 *                                        \><||i|=>>%)     / /   __/ /___/ /_
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    / /__ /_  __/_  __/
 * The project is licensed under GPLv3,   -<>>=|><|||`    \____/ /_/   /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * XenodreambuieV2
 * @reference
 *https://fractalforums.org/share-a-fractal/22/new-mandelbulb-variant/5083
 */

#include "all_fractal_definitions.h"

cFractalXenodreambuieV2::cFractalXenodreambuieV2() : cAbstractFractal()
{
	nameInComboBox = "Xenodreambuie V2";
	internalName = "xenodreambuie_v2";
	internalID = fractal::xenodreambuieV2;
	DEType = analyticDEType;
	DEFunctionType = logarithmicDEFunction;
	cpixelAddition = cpixelEnabledByDefault;
	defaultBailout = 10.0;
	DEAnalyticFunction = analyticFunctionLogarithmic;
	coloringFunction = coloringFunctionDefault;
}

void cFractalXenodreambuieV2::FormulaCode(CVector4 &z, const sFractal *fractal, sExtendedAux &aux)
{
	double th = (asin(z.z / aux.r) + fractal->bulb.betaAngleOffset) * fractal->bulb.power;
	double ph = (atan2(z.y, z.x) + fractal->bulb.alphaAngleOffset) * fractal->bulb.power;

	double rp = pow(aux.r, fractal->bulb.power - 1.0);

	if (cos(th) < 0.0) ph = ph + M_PI;

	aux.DE = rp * aux.DE * fabs(fractal->bulb.power) + 1.0;
	rp *= aux.r;
	// polar to cartesian
	double cth = cos(th);
	z.x = cth * cos(ph) * rp;
	z.y = cth * sin(ph) * rp;
	z.z = sin(th) * rp;
}