//
//  ProofOfWorkValidator.swift
//
//  Created by Sun on 2022/10/6.
//

import Foundation

import BigInt
import BitcoinCore

class ProofOfWorkValidator: IBlockValidator {
    // MARK: Properties

    var hasher: (Data) -> Data

    private let difficultyEncoder: IDifficultyEncoder

    // MARK: Lifecycle

    init(hasher: @escaping (Data) -> Data, difficultyEncoder: IDifficultyEncoder) {
        self.hasher = hasher
        self.difficultyEncoder = difficultyEncoder
    }

    // MARK: Functions

    func validate(block: Block, previousBlock _: Block) throws {
        let header = serializeHeader(block: block)
        let hash = hasher(header)

        guard difficultyEncoder.compactFrom(hash: hash) < block.bits else {
            throw BitcoinCoreErrors.BlockValidation.invalidProofOfWork
        }
    }

    private func serializeHeader(block: Block) -> Data {
        var data = Data()

        data.append(Data(from: UInt32(block.version)))
        data += block.previousBlockHash
        data += block.merkleRoot
        data.append(Data(from: UInt32(block.timestamp)))
        data.append(Data(from: UInt32(block.bits)))
        data.append(Data(from: UInt32(block.nonce)))

        return data
    }
}
