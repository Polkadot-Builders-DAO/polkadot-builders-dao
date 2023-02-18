// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {IPBTokenPartsStore} from "./interfaces/IPBTokenPartsStore.sol";

contract PBTokenPartsStore is IPBTokenPartsStore, Ownable {
    Color[] public bgColors;
    Color[] public googlesColors;
    ImagePart[] public crowns;
    ImagePart[] public doodads;
    ImagePart[] public garlands;
    ImagePart[] public shields;
    Palette[] public logoPalettes;
    ImagePart[] public logos1;
    ImagePart[] public logos2;
    ImagePart[] public logos3;
    ImagePart[] public logos4;

    function bgColorsCount() external view returns (uint256) {
        return bgColors.length;
    }

    function googlesColorsCount() external view returns (uint256) {
        return googlesColors.length;
    }

    function crownsCount() external view returns (uint256) {
        return crowns.length;
    }

    function doodadsCount() external view returns (uint256) {
        return doodads.length;
    }

    function garlandsCount() external view returns (uint256) {
        return garlands.length;
    }

    function shieldsCount() external view returns (uint256) {
        return shields.length;
    }

    function logoPalettesCount() external view returns (uint256) {
        return logoPalettes.length;
    }

    function logos1Count() external view returns (uint256) {
        return logos1.length;
    }

    function logos2Count() external view returns (uint256) {
        return logos2.length;
    }

    function logos3Count() external view returns (uint256) {
        return logos3.length;
    }

    function logos4Count() external view returns (uint256) {
        return logos4.length;
    }

    function getBgColor(uint8 id) external view returns (Color memory) {
        return bgColors[id];
    }

    function getGooglesColor(uint8 id) external view returns (Color memory) {
        return googlesColors[id];
    }

    function getCrown(uint8 id) external view returns (ImagePart memory) {
        return crowns[id];
    }

    function getDoodad(uint8 id) external view returns (ImagePart memory) {
        return doodads[id];
    }

    function getGarland(uint8 id) external view returns (ImagePart memory) {
        return garlands[id];
    }

    function getShield(uint8 id) external view returns (ImagePart memory) {
        return shields[id];
    }

    function getLogoPalette(uint8 id) external view returns (Palette memory) {
        return logoPalettes[id];
    }

    function getLogo1(uint8 id) external view returns (ImagePart memory) {
        return logos1[id];
    }

    function getLogo2(uint8 id) external view returns (ImagePart memory) {
        return logos2[id];
    }

    function getLogo3(uint8 id) external view returns (ImagePart memory) {
        return logos3[id];
    }

    function getLogo4(uint8 id) external view returns (ImagePart memory) {
        return logos4[id];
    }

    function addBgColor(Color calldata color) external onlyOwner {
        //    require(bgColors.length < 255, "To many entries");
        bgColors.push(color);
    }

    function addGooglesColor(Color calldata color) external onlyOwner {
        //    require(googlesColors.length < 255, "To many entries");
        googlesColors.push(color);
    }

    function addCrown(ImagePart calldata part) external onlyOwner {
        //   require(crowns.length < 255, "To many entries");
        crowns.push(part);
    }

    function addDoodad(ImagePart calldata part) external onlyOwner {
        //   require(doodads.length < 255, "To many entries");
        doodads.push(part);
    }

    function addGarland(ImagePart calldata part) external onlyOwner {
        //  require(garlands.length < 255, "To many entries");
        garlands.push(part);
    }

    function addShield(ImagePart calldata part) external onlyOwner {
        //   require(shields.length < 255, "To many entries");
        shields.push(part);
    }

    function addLogoPalette(Palette calldata palette) external onlyOwner {
        //    require(logoPalettes.length < 255, "To many entries");
        logoPalettes.push(palette);
    }

    function addLogo1(ImagePart calldata part) external onlyOwner {
        //    require(logos1.length < 255, "To many entries");
        logos1.push(part);
    }

    function addLogo2(ImagePart calldata part) external onlyOwner {
        //    require(logos2.length < 255, "To many entries");
        logos2.push(part);
    }

    function addLogo3(ImagePart calldata part) external onlyOwner {
        //    require(logos3.length < 255, "To many entries");
        logos3.push(part);
    }

    function addLogo4(ImagePart calldata part) external onlyOwner {
        //   require(logos4.length < 255, "To many entries");
        logos4.push(part);
    }

    function getColorNames(Color[] memory colors) private pure returns (string[] memory) {
        string[] memory names = new string[](colors.length);
        for (uint256 i = 0; i < colors.length; i++) {
            names[i] = colors[i].name;
        }
        return names;
    }

    function getPaletteNames(Palette[] memory palettes) private pure returns (string[] memory) {
        string[] memory names = new string[](palettes.length);
        for (uint256 i = 0; i < palettes.length; i++) {
            names[i] = palettes[i].name;
        }
        return names;
    }

    function getImagePartNames(ImagePart[] memory parts) private pure returns (string[] memory) {
        string[] memory names = new string[](parts.length);
        for (uint256 i = 0; i < parts.length; i++) {
            names[i] = parts[i].name;
        }
        return names;
    }

    function getAllTraits() external view returns (AvailableTraits memory) {
        return
            AvailableTraits(
                getColorNames(bgColors),
                getColorNames(googlesColors),
                getImagePartNames(crowns),
                getImagePartNames(doodads),
                getImagePartNames(garlands),
                getImagePartNames(shields),
                getPaletteNames(logoPalettes),
                getImagePartNames(logos1),
                getImagePartNames(logos2),
                getImagePartNames(logos3),
                getImagePartNames(logos4)
            );
    }
}
