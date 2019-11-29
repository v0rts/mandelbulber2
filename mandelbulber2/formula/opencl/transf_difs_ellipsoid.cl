/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2019 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * TransfDIFSEllipsoidIteration  fragmentarium code, mdifs by knighty (jan 2012)
 * and http://www.iquilezles.org/www/articles/distfunctions/distfunctions.htm

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "TransfDIFSEllipsoidIteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 TransfDIFSEllipsoidIteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	REAL4 zc = z;
	REAL4 rads4 = fractal->transformCommon.additionConstant111;
	REAL3 rads3 = (REAL3){rads4.x, rads4.y, rads4.z};

	REAL3 rV = (REAL3){zc.x, zc.y, zc.z};
	rV /= rads3;

	REAL3 rrV = rV;
	rrV /= rads3;

	REAL rd = length(rV);
	REAL rrd = length(rrV);
	REAL ellD = rd * native_divide((rd - 1.0f), rrd);
	aux->dist = min(aux->dist, native_divide(ellD, (aux->DE + 1.0f)));
	return z;
}